class Product < ApplicationRecord
	has_many :orders
	has_many :likes, dependent: :destroy

	def liked?(user)
		!!self.likes.find{|like| like.user_id == user.id}
		
	end
end

