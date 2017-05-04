class Api::V1::RelationshipsController < Api::V1::BaseController

  def show
    @user = User.find_by(id: params[:id])
    @followings = @user.following
    @followers = @user.followers
    render partial: 'api/v1/relationships/show', status: :ok
  end

  def create
    current_user = User.find_by(id: params[:relationship][:current_user_id])
    target_user = User.find_by(id: params[:relationship][:target_user_id])
    if current_user && target_user && current_user.mobile_authenticated?(params[:mobile_token])

      if(params[:relationship][:action_type] == "Follow")
        current_user.follow(target_user);
      else
        current_user.unfollow(target_user);
      end

      render json: {
        result: "Success",
        target_user_followers_count: target_user.followers.count,
        target_user_following_count: target_user.following.count
      }, status: 	:ok

    else
      render json: {
        errors: "Invalid email/password combination",
      }, status: 	:unauthorized
    end
  end

end
