class SessionsController < ApplicationController
  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome"
        redirect_to "/posts"
      else
        flash["notice"] = "Wrong password"
        redirect_to "/login"
      end
    else
      flash["notice"] = "User doesn't exists"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Logged off"
    redirect_to "/login"
  end
end
  