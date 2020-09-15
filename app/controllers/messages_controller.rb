class MessagesController < ApplicationController
  def create
    @post= Post.find(params[:post_id])
    @message = Messages.new(message_params)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    render :index
  end

  private
  def message_params
    params.require(:message).permit(:content, :post_id)
  end
end
