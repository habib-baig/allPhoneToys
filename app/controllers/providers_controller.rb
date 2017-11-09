class ProvidersController < ApplicationController
  before_action :require_admin, :admin_privacy, only: [:index, :new]

  def index
    @providers = Provider.all
  end

  def new
    @provider = Provider.new;
  end

  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to providers_path, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Provider.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to providers_path, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def provider_params
      params.require(:provider).permit(:provider)
    end
end
