module TopicsHelper
	def user_is_authorized_to_edit_for_topics?
		(current_user && (current_user.admin? || current_user.moderator?))
	end

	def user_is_authorized_to_delete_for_topics?
		(current_user && current_user.admin?)
	end

	def user_is_authorized_to_create_for_topics?
		(current_user && current_user.admin?)
	end
end
