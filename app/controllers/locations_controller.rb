class LocationsController < ApplicationController
  before_action :require_admin, :admin_privacy, only: [:index, :new]

  def index
    @locations = Location.all;
  end

  def new
    @location = Location.new;
  end

  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to locations_path, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to locations_path, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def location_params
      params.require(:location).permit(:location)
    end
end
