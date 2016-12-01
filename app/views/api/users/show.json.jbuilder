
json.partial! 'user', user: @user
json.user do
  json.id @user.id
  json.nickname @user.nickname
end