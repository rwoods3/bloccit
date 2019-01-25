class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :post

	after_create :send_favorite_emails

	private

	def send_favorite_emails
	   FavoriteMailer.new_post(user, post).deliver_now
	end
end
