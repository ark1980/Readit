class SummariesController < ApplicationController
  # def show
  #   @post = Post.find(params[:post_id])
  #   @summary = @post.summary
  # end

  # def new
  #   @post = Post.find(params[:post_id])
  #   @summary = Summary.new
  # end

  def create
    @post = Post.new(params.require(:post).permit!)
    @summary = @post.summary.create(params[:summary].permit(:body))
    if @summary.save
      flash[:notice] = "Your summary has saved"
      redirect_to [@post, @summary]
    else
      flash[:error] = "Error"
      render :new
    end
  end
end
