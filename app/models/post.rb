class Post < ApplicationRecord
	belongs_to :topic
    belongs_to :user
	has_many :comments, dependent: :destroy

   	validates :title, length: { minimum: 5 }, presence: true
   	validates :body, length: { minimum: 20 }, presence: true
   	validates :topic, presence: true
    validates :user, presence: true

	default_scope { order('created_at DESC') }
	scope :ordered_by_title, -> { order('title ASC') }
	scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }

	def self.censor_posts()
		self.all.each_with_index { |p, index| p.update_attributes!(title: 'SPAM') if index == 0 || ((index+1) % 5) == 0 }
	end
end
