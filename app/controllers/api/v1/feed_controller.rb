class Api::V1::FeedController < Api::V1::BaseController

  def show
    @user = User.find(params[:id])
    @microposts = @user.feed

    render partial: 'api/v1/feed/show', status: :ok
  end

end
