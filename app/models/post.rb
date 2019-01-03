class Post < ApplicationRecord
	belongs_to :topic
	has_many :comments, dependent: :destroy

   	validates :title, length: { minimum: 5 }, presence: true
   	validates :body, length: { minimum: 20 }, presence: true
   	validates :topic, presence: true

	def self.censor_posts()
		self.all.each_with_index { |p, index| p.update_attributes!(title: 'SPAM') if index == 0 || ((index+1) % 5) == 0 }
	end
end
