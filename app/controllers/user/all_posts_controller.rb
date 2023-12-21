class User::AllPostsController < ApplicationController
  def index
    if params[:tag]
      # @tagに検索ワードを代入
      @tag = Tag.find_by(name: params[:tag])
      # @tagがnilじゃないなら@tag.postsで表示,@tagがnilなら空のクエリセット(Post.none)でアラート
      if @tag
        @posts = @tag.posts
      else
        flash.now[:alert] = "指定されたタグは存在しません"
        @posts =  Post.none
      end
    else
      @posts = Post.all.order(created_at: :desc)
    end
    @tags = Tag.all
    @post = Post.new
  end
end
