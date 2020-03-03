class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to root
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def delete

  end
end
