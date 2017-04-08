class TopController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @topics = Topic.order(:created_at).reverse_order.all
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

end
