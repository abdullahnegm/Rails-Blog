module Test extend ActiveSupport::Concern

    included do
        scope :participating, -> user do
            where("(conversations.sender_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
        end

        scope :between, -> (sender_id, receiver_id) do
            where(sender_id: sender_id, receiver_id: receiver_id).or(where(sender_id: receiver_id, receiver_id: sender_id)).limit(1)
        end
    end

    def with(current_user)
        sender == current_user ? receiver : sender
    end

    def participates?(user)
        sender == user || receiver == user
    end

end