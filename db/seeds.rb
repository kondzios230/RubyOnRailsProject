User.delete_all
Coment.delete_all
News.delete_all

user = User.create(name: "Admin", email: "admin@admin.com", password: "foobar",password_confirmation: "foobar", admin: true)

5.times do
  content = Faker::Lorem.sentence(5000)
  user.news.create!(content: content, title:"Tytuł")
end

user2 = User.create(name: "RandomUser", email: "user@random.com", password: "foobar",password_confirmation: "foobar", admin: false)

posts = News.all
posts.each do |post|
    5.times do
        Coment.create(content: Faker::Lorem.sentence(5), news_id: post.id, user_id: user2.id)
         end
    end

User.create(name: "Another Admin", email: "admin@random.com", password: "foobar",password_confirmation: "foobar", admin: true)