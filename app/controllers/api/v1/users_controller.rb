class Api::V1::UsersController < Api::V1::BaseController

  def index
    @users = User.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])

    render partial: 'api/v1/users/user', status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render partial: 'api/v1/users/user', status: :created
    else
      render json: {
        errors: @user.errors.full_messages,
      }, status: 	:unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render partial: 'api/v1/users/user', status: :ok
    else
      render json: {
        errors: @user.errors.full_messages,
      }, status: 	:unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: {
      result: "User deleted",
    }, status: 	:ok

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
