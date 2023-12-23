class User::AllPostsController < ApplicationController
  def index
    if params[:tag]
      @tag = Tag.find_by(name: params[:tag])
      # @tagがnilじゃないなら@tag.postsで表示,@tagがnilなら空のクエリセット(Post.none)でアラート
      if @tag
        @posts = @tag.posts.page(params[:page]).per(5)
      else
        flash.now[:alert] = "指定されたタグは存在しません"
        @posts = Post.none
      end
    else
      @posts = Post.page(params[:page]).per(5)
    end
    @tags = Tag.all
    @post = Post.new
  end
end
