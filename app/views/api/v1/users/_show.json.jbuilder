json.extract! @user, :id, :name, :email, :created_at, :updated_at
json.followers_count @user.followers.count
json.following_count @user.following.count
json.url user_url(@user, format: :json)

json.followers do
  json.array! @user.followers do |follower|
    json.id follower.id.to_s
  end
end


json.microposts do
  json.array! @microposts do |post|
    json.id post.id
    json.user_id post.user_id
    json.content post.content
    json.created_at time_ago_in_words(post.created_at) + " ago"
  end
end
