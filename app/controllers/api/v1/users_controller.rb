class Api::V1::UsersController < Api::V1::BaseController

  def index
    @users = User.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])

    #render json: {
    #  yey: 'hahah'
    #}

    render partial: 'api/v1/users/user'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render partial: 'api/v1/users/user', status: 201
    else
      render json: {
        errors: @user.errors.full_messages,
      }, status: 422
    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
