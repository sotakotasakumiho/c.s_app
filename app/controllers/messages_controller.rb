class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

      respond_to do |format|
        format.html { redirect_to post_path(params[:post_id])}
        format.json
      end
  end

  private
  def message_params
    params.require(:message).permit(:contet, :post_id)
  end
end
