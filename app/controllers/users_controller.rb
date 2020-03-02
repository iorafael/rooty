class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params_user)
    user.save ? redirect_to root : render :new
  end

  def edit
    
  end

  def update
    
  end

  def delete
    
  end
end
