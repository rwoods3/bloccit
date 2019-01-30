module UsersHelper
	def avatar_url(user)
	 gravatar_id = Digest::MD5::hexdigest(user.email).downcase
	 "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
	end

	def has_posts
	@user.posts.any?
	end

	def has_comments
	@user.comments.any?
	end

	def has_favorites
	@user.favorites.any?
	end
end
