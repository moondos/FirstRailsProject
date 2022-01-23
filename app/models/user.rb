class User < ApplicationRecord
    validates :email, uniqueness:true 
    validates :email, presence:true
    validates :password, length: {minimum: 5, allow_nil:true} 

    has_secure_password

    has_many :notifications, foreign_key: :recipient_id
end
 