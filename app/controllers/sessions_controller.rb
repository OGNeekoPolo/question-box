class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:user][:username])

    respond_to do |format|
      if @user && @user.authenticate(params[:user][:password])
        session[:current_user_id] = @user.id
        format.html {redirect_to questions_path}
        format.json {render json: {token: @user.api_token}}
      else
        format.html {redirect_to new_user_path, notice: "User not found. Please register new user."}
        format.json {render json: {error: "Invalid"}, status: :unauthorized}
      end
    end
  end

  def destroy
    reset_session
    redirect_to users_path
  end
end
