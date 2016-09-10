# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |t|
  Micropost.create(user_id: 1, content: "これは #{User.find(1).name} の #{t} 番目のコンテンツ")
  Micropost.create(user_id: 2, content: "これは #{User.find(2).name} の #{t} 番目のコンテンツ")
end

10.times do |t|
  User.create(name: "ユーザー#{t}号")
end