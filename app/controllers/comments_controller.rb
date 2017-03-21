class CommentsController < ApplicationController
  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @notification = @comment.notifications.build(user_id: @topic.user.id ) if current_user.comment_user?(@topic)

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
        # JS形式でレスポンスを返します。
        format.js { render :index }
        unless @comment.topic.user_id == current_user.id
          Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'comment_created', {
            message: 'あなたの作成したブログにコメントが付きました'
          })
          Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'notification_created', {
            unread_counts: Notification.where(user_id: @comment.topic.user.id, read: false).count
          })
        end
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
      @comment = Comment.find(params[:id])
    # クライアント要求に応じてフォーマットを変更
      @comment.destroy
      render :index
  end
  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end
end
