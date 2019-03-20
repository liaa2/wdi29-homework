class Sneaker < ApplicationRecord
  belongs_to :brand, optional: true
end
