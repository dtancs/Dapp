class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
    end
  end

  def download_apk
    send_file "#{Rails.root}/app/assets/docs/dapp-release.apk"
  end
end
