class Feed < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :notetype,presence:true
    validates :context,presence:true
end
