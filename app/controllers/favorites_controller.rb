class FavoritesController < ApplicationController

  def create
    @service = Service.find(params[:service_id])
    @favourite = current_user.Favorite.new
    if @favourite.current_user.save = Favourite.new.current_user.service
      flash[:notice] = "Favourites successfully added"
    else 
      flash[:alert] = "Unable to add service to favorites."
    end
  end

  # def destroy 
  #   @service = Service.find(params[:service_id])
  #   if @favourite.current_user.destroy
  #     flash[:notice] = "Favourites successfully removed"
  #   end
  # end

end