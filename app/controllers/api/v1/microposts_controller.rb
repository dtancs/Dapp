class Api::V1::MicropostsController < Api::V1::BaseController

  def create
    user = User.find_by(id: params[:session][:id])
    if user && user.mobile_authenticated?(params[:session][:mobile_token])

      @micropost = user.microposts.build(micropost_params)
      if @micropost.save
        render json: {
          result: "Micropost created successfully"
        }, status: 	:created
      else
        render json: {
          result: "Failed to create micropost"
        }, status: 	:bad_request
      end

    else
      render json: {
        errors: "Please log in and try again.",
      }, status: 	:unauthorized
    end
  end

  def destroy

  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end

end
