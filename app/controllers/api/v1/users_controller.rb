class Api::V1::UsersController < Api::V1::BaseController
  def show
    @user = User.find(params[:id])

    #render json: {
    #  yey: 'hahah'
    #}

    render partial: 'api/v1/users/user'

  end
end
