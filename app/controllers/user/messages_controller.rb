class User::MessagesController < ApplicationController
  before_action :reject_non_related, only: [:show]
  before_action :authenticate_custom_user!

  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)

    unless entries.nil?
      @room = entries.room
    else
      @room = Room.new
      @room.save
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to request.referer
    else
      redirect_to request.referer, alert: "送信に失敗しました"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to request.referer
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end

  def reject_non_related
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to user_path(current_user), notice: "相互フォロー限定の機能です"
    end
  end

end
