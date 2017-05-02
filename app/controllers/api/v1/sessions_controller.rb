class Api::V1::SessionsController < Api::V1::BaseController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in .
      user.remember_mobile

      render json: {
        user_id: user.id.to_s,
        user_name: user.name.to_s,
        mobile_token: user.mobile_token
      }, status: 	:ok

    else
      render json: {
        errors: "Invalid email/password combination",
      }, status: 	:unauthorized
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user && user.mobile_authenticated?(params[:mobile_token])
      # Log the user in .
      user.forget_mobile

      render json: {
        result: "Logout success",
      }, status: 	:ok

    else
      render json: {
        errors: "Unable to logout user",
      }, status: 	:unauthorized
    end
  end

end
