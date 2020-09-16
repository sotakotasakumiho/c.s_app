class MessagesController < ApplicationController
  def create
    @message = current_user.messages.new(message_params)

    if @message.save
       redirect_to (@post), notice: 'コメントが投稿されました'
    else
      redirect_to (@post), notice: 'コメントを入力してください'
    end

      respond_to do |format|
        format.html { redirect_to (@post)}
        format.json
      end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
