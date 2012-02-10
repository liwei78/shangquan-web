#encoding: utf-8
# test account
puts "Create Some Test Account"
User.create([
  {:email => "aaa@123.com", :name => "AAA", :password => "1234"},
  {:email => "bbb@123.com", :name => "BBB", :password => "1234"},
  {:email => "ccc@123.com", :name => "CCC", :password => "1234"}]
)

# fake account
puts "Create Some Fake Account"
20.times do
  user = User.new
  user.name       = Faker::Name.name
  user.email      = Faker::Internet.email
  user.password   = "1234"
  user.created_at = Time.now
  user.updated_at = Time.now
  user.save
end

# Some Article for users/1
puts "50 Articles for users/1"
50.times do
  Article.create(:title => Faker::Lorem.sentence(word_count = 4), :content => Faker::Lorem.paragraphs(paragraph_count = 3), :user_id => 1 )
end
puts "200 Articles for All Users rand"
200.times do
  Article.create(:title => Faker::Lorem.sentence(word_count = 4), :content => '<p>'+Faker::Lorem.paragraphs(paragraph_count = 3).join('</p><p>')+'</p>', :user_id => rand(22) )
end

puts "50 Companies"
50.times do
  Company.create(:title => Faker::Lorem.sentence(word_count = 4))
end

puts "50 Activities"
50.times do
  Activity.create(:title => Faker::Lorem.sentence(word_count = 4), :schedule => "2012年1月1日-2012年1月15日", :address => "巴黎春天中山公园店")
end
