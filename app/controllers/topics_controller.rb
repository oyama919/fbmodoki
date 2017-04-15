class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to root_path
  end

  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to root_path, notice:"投稿されました"
    else
      redirect_to root_path, alert:"未入力の項目があります"
      @topic = Topic.new(topics_params)
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path, notice:"投稿を更新しました"
  end

  def destroy
    @topic.destroy
    redirect_to root_path, alert:"投稿を削除しました"
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  private
    def topics_params
      params.require(:topic).permit(:title,:content)
    end
    def set_topic
      @topic = Topic.find(params[:id])
    end
end
