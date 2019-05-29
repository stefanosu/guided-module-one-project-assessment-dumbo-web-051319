class User < ActiveRecord::Base 
    def change
    has_many :poems, through: :favorites
    end
end