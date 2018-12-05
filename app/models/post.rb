class Post < ApplicationRecord
	has_many :comments
	attr_accessor :censor_posts

	def self.censor_posts()
		self.all.each_with_index { |p, index| p.update_attributes!(title: 'SPAM') if index == 0 || ((index+1) % 5) == 0 }
	end
end
