class User < ActiveRecord::Base 
    has_many :favorites
    has_many :poems, through: :favorites

    # def favorites
    #     Favorite.all.select do |favorite|
    #         favorite.user == self
    #     end
    # end
end



