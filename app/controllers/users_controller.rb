class UsersController < ApplicationController
  def index
    if params[:query]
      @users = User.where('lower(fname) = ?', params[:query].downcase)
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = 'User was deleted!'
    redirect_to users_path
  end

  def new
  end

  def create
    if User.create(user_params)
      flash[:notice] = 'User created successfully!'
      redirect_to users_path
    else
      flash.now[:error] = 'Please fix your errors!'
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:notice] = 'User updated successfully!'
      render "edit"
    else
      flash.now[:alert] = 'Sorry there is a problem!'
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :fname,
      :lname,
      :email,
      :password
    )
  end

end
