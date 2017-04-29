json.extract! @user, :id, :name, :email, :created_at, :updated_at
json.url user_url(@user, format: :json)

json.microposts do
  json.array! @microposts do |post|
    json.id post.id
    json.user_id post.user_id
    json.content post.content
    json.created_at time_ago_in_words(post.created_at) + " ago"
  end
end
