class User < ApplicationRecord
    has_many :feeds
    
    before_save do
        self.email = email.downcase
    end
    validates :name,presence:true,length:{maximum:508},uniqueness:true
    validates :email,presence:true,uniqueness:true

    has_secure_password


    def self.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

end
