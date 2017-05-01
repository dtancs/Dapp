
json.array! @microposts do |post|
  json.id post.id
  json.user_id post.user_id
  json.content post.content
  json.created_at time_ago_in_words(post.created_at) + " ago"
  json.user_name post.user.name
  json.user_email post.user.email
end
