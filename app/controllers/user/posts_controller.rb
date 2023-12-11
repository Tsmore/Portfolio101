class User::PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = current_user.posts
    @tags = @post.tags.pluck(:name).join(',')
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      @post.save_tags(post_params[:tags]).split(',')
      flash[:notice] = "投稿しました"
      redirect_to user_post_path(current_user, @post)
    else
      @posts = current_user.posts
      render :index
    end
  end

  def update
    @post = Post.find(params[:id])
    tags = params[:post][:tag_id].split(',')
    if @post.update(post_params)
      @post.update_tags(tags)
      flash[:notice] = "編集が完了しました"
      redirect_to @post
    else
      render :show
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image)
  end

end
