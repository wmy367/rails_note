class Feed < ApplicationRecord
    belongs_to :user
    validates :notetype,presence:true
    validates :context,presence:true
end
