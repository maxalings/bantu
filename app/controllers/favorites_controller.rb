class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @service = Service.find(params[:service_id])
    favorite = current_user.favorites.find_by(service: @service)

    if favorite
      favorite.destroy
      flash.now[:alert] = "not added"
      render json: { success: true, action: "removed", message: "Favorite removed successfully!"  }
    else
      favorite = current_user.favorites.build(service: @service)
      if favorite.save
        flash.now[:notice] = "added"
        render json: { success: true, action: "added", message: "Favorite added successfully!"  }
      else
        render json: { success: false, message: "Unable to update favorites" }, status: :unprocessable_entity
      end
    end
  end
end
