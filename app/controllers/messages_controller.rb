class MessagesController < ApplicationController
    before_action :find_conversation!

    def create
      @conversation ||= Conversation.create(sender_id: current_user.id,
                                            receiver_id: @receiver.id)
      @message = current_user.messages.build(message_params)
      @message.conversation_id = @conversation.id
      @message.save!

      @receiver = User.find_by(id: params[:receiver_id])

      ActionCable.server.broadcast @conversation.with(current_user).id, {message: @message.body}
    
      flash[:success] = "Your message was sent!"
      respond_to do |format| 
        format.js {render partial: 'message', locals: { message: @message }}
        # format.html { redirect_to conversation_path(@conversation) }
      end
      # redirect_to conversation_path(@conversation)
    end

    def new
      redirect_to conversation_path(@conversation) and return if @conversation
      @message = current_user.messages.build
    end
  
    private
  
    def message_params
      params.require(:message).permit(:body)
    end
  
    def find_conversation!
      if params[:receiver_id]
        @receiver = User.find_by(id: params[:receiver_id])
        redirect_to(root_path) and return unless @receiver
        @conversation = Conversation.between(current_user.id, @receiver.id)[0]
      else
        @conversation = Conversation.find_by(id: params[:conversation_id])
        redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
      end
    end
    # def find_conversation!
    #   @conversation = Conversation.find( params[:conversation_id] )
    #   redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
    # end
  end