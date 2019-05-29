class Poem < ActiveRecord::Base 
    def change
        has_many :users, through: :favorites 
        belongs_to :poet 
    end
end 
