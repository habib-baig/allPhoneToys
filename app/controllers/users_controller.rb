class UsersController < ApplicationController
  before_action :require_user, :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_privacy, only: [:index]

  # GET /users
  # GET /users.json
  def index
    #@users = User.all

    session[:user_name] = params[:name]
    session[:user_email] = params[:email]
    session[:user_phone] = params[:phone]
    session[:user_pref_amount] = params[:prefAmount]
    session[:user_pref_provider] = params[:prefProvider]
    session[:user_pref_location] = params[:prefLocation]

    @users = User.where(nil) # creates an anonymous scope
    @users = @users.user_name(session[:user_name]) if session[:user_name].present?
    @users = @users.user_email(session[:user_email]) if session[:user_email].present?
    @users = @users.user_phone(session[:user_phone]) if session[:user_phone].present?
    @users = @users.user_pref_amount(session[:user_pref_amount]) if session[:user_pref_amount].present?
    @users = @users.user_pref_provider(session[:user_pref_provider]) if session[:user_pref_provider].present?
    @users = @users.user_pref_location(session[:user_pref_location]) if session[:user_pref_location].present?


  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :prefProvider, :prefAmount, :prefLocation)
    end
end
