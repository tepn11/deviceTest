class MapController < ApplicationController
  def view
    if current_user  
     @myLocations = Location.my_locations current_user.id
     @myFriendsLocations = Location.my_friends_locations current_user.id
     @publicLocations = Location.public_locations
    else
      redirect_to new_user_registration_path 
    end
  end

  def share

  end

  def shareLocation
    coords = params[:coords]
    share = params[:share]
    user = params[:user]
    if user && share && coords
      newLoc = Location.new()
      newLoc.user_id = user
      newLoc.share_type = share
      newLoc.coordinates = coords
      newLoc.save!
      if newLoc
        render json: {sucess: true, msg: "Successfully created new location."}, status: :created
      else
        puts newLoc.errors
        render json: {sucess: false, msg: "Error creating new location."}, status: 500
      end
    else
      render json: {sucess: false, msg: "Missing params."}, status: 400
    end
  end
end
