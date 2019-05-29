class Poet < ActiveRecord::Base 
     def change 
        has_many :poems
     end
end