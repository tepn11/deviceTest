class MapController < ApplicationController
  def view
  	@ownLocations = [[12,25],[56,21]]
  	# @ownLocations.push([12,25])
  	# @ownLocations.push([56,21])
  	print @ownLocations

  	# logger.debug YAML::dump(current_user)
  	puts current_user.id

  	@friends = Friend.where(user_id: current_user.id)
  	# @myLocations = Location.joins(:user, :friends).where("user_id = ?", current_user.id)
  	@myLocations = Location.find_by_sql("SELECT l.* FROM locations l where user_id = #{current_user.id} OR user_id in(SELECT f.friend_id FROM friends f where user_id = #{current_user.id} ) OR l.share_type = 'public'")
  	# @publicLocations = Location.where(share_type: "public")
  	print @myLocations
  	# logger.debug YAML::dump(@friends)
  	# logger.debug YAML::dump(@myLocations)
  	# logger.debug YAML::dump(@publicLocations)
  end

  def share
  end
end
