class User::PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @post = Post.new
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @report = Report.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to request.referer, notice: "投稿しました"
    else
      @posts = current_user.posts
      redirect_to request.referer, alert: "投稿に失敗しました"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer, notice: "編集が完了しました"
    else
      @posts = current_user.posts
      redirect_to request.referer, alert: "編集に失敗しました"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer, alert: "投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_list, post_image: [])
  end

end
