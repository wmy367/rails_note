class Comment < ApplicationRecord
    belongs_to :feed
    validates :context,presence:true
end
