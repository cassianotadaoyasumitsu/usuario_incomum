json.extract! @user, :id, :name, :gender, :age, :kind, :address, :phone, :prefecture, :nihongo, :note, :work, :extra

json.keeps @user.keeps do |keep|
  json.extract! keep, :id, :post_id, :user_id
end
