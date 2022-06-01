class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create
    @user["username"] = params["user"]["username"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/"
  end
end