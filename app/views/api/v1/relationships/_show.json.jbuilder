json.following do
  json.array! @followings do |follow|
    json.user_id follow.id
    json.name follow.name
    json.email follow.email
  end
end

json.followers do
  json.array! @followers do |follow|
    json.user_id follow.id
    json.name follow.name
    json.email follow.email
  end
end
