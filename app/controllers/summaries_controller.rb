class SummariesController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def new
    @post = Post.new(params[:post_id])
    @summary = Summary.new
  end

  def create
    @posts = Post.find(params[:id])
    @summary = Summary.new(params.require(:summary).permit(:body))
    @post.user = current_user
    if @summary.save
      flash[:notice] = "Your summary has saved"
      redirect_to [@post, @summary]
    else
      flash[:error] = "Error"
      render :new
    end
  end
end
