class Book < ApplicationRecord #Inherit behaviour from Activerecord
  belongs_to :author
end
