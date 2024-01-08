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
    @post.score = Language.get_data(post_params[:body])
    if @post.save
      redirect_to request.referer, notice: "投稿しました"
    else
      @posts = current_user.posts
      redirect_to request.referer, alert: "投稿に失敗しました"
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.score = Language.get_data(post_params[:body])
    if @post.update(post_params)
      redirect_to request.referer, notice: "編集が完了しました"
    else
      @posts = current_user.posts
      redirect_to request.referer, alert: "編集に失敗しました"
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      @post.destroy
      redirect_to request.referer, alert: "投稿を削除しました"
    else
      redirect_to request.referer, alert: "不正なアクセスです"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_list, post_image: [])
  end

end
