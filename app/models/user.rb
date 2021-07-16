class User < ApplicationRecord
	has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :first_name, presence: true, length: { minimum: 3, maximum: 100 }

	validates :last_name, presence: true, length: { minimum: 3, maximum: 100 }


	def full_name
		return "#{first_name} #{last_name}" if first_name ||last_name
		"Anonymous"
	end
end
