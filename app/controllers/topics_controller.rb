class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.find(params.require(:topic).permit(:name, :public, :description))
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topics
    if @topic.update_attributes(params.require(:topic).permit(:name, :public, :description))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

end
