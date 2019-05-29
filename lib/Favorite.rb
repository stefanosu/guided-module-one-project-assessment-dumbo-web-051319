class Favorite < ActiveRecord::Base  
    def change
        belongs_to :users 
        belongs_to :poems
    end
end