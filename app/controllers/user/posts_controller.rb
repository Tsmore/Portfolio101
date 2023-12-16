class User::PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @report = Report.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to request.referer
    else
      puts @post.errors.full_messages
      @posts = current_user.posts
      render :index
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集が完了しました"
      redirect_to @post
    else
      render :show
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :tag_list)
  end

end
