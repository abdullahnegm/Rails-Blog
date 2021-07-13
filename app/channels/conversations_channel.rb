class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "conversation_channel"
    stream_from current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def send_message(data)
  #   conversation = Conversation.find_by(id: data['conversation_id'])
  #   if conversation && conversation.participates?(current_user)
  #     message = current_user.messages.build({body: data['message']})
  #     message.conversation = conversation
  #     message.save!
  #   end
  # end
end
