class User::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).limit(5)
    @report = Report.new
    @post = Post.new

    # DM用
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "updated"
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      redirect_to root_path, notice: "いままでご利用ありがとうございました"
    else
      redirect_to request.referer, alert: "アカウントの削除に失敗しました　もう一度お願いします"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :introduction, :user_image)

  end
end
