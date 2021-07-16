class Product < ApplicationRecord
	has_many :orders

	def self.remove_q(quantity)
     @quantity = quantity - 1
  	end


end

