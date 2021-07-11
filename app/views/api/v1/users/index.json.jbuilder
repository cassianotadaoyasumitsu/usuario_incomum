json.array! @users do |user|
  json.extract! user, :id, :name, :gender, :age, :kind, :address, :phone, :prefecture, :nihongo, :note, :work, :extra
end


