class User < ActiveRecord::Base 
    has_many :favorites
    has_many :poems, through: :favorites

end




