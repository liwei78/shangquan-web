#encoding: utf-8
require 'open-uri'
# test account
puts "Create Test Account"
User.create([
  {:email => "aaa@123.com", :name => "AAA", :password => "1234", :password_confirmation => "1234"},
  {:email => "bbb@123.com", :name => "BBB", :password => "1234", :password_confirmation => "1234"},
  {:email => "ccc@123.com", :name => "CCC", :password => "1234", :password_confirmation => "1234"}]
)

# 
# # fake account
# puts "Create Some Fake Account"
# 20.times do
#   user = User.new
#   user.name       = Faker::Name.name
#   user.email      = Faker::Internet.email
#   user.password   = "1234"
#   user.created_at = Time.now
#   user.updated_at = Time.now
#   user.save
# end
# 
# # Some Article for users/1
# puts "50 Articles for users/1"
# 50.times do
#   Article.create(:title => Faker::Lorem.sentence(word_count = 4), :content => Faker::Lorem.paragraphs(paragraph_count = 3), :user_id => 1, :article_type =>'article')
# end
# puts "200 Articles for All Users rand"
# 200.times do
#   Article.create(:title => Faker::Lorem.sentence(word_count = 4), :content => '<p>'+Faker::Lorem.paragraphs(paragraph_count = 3).join('</p><p>')+'</p>', :user_id => rand(22), :article_type =>'article')
# end
# 
# puts "50 Companies"
# 50.times do
#   Company.create(:title => Faker::Lorem.sentence(word_count = 4))
# end
# 
# puts "50 Activities"
# 50.times do
#   Activity.create(:title => Faker::Lorem.sentence(word_count = 4), :schedule => "2012年1月1日-2012年1月15日", :address => "巴黎春天中山公园店")
# end
# 
# puts "50 Brands"
# 50.times do
#   Brand.create(:title => Faker::Lorem.sentence(word_count = 1), :nation => 1, :letter => "A", :category_id => 1 )
# end
# 
# puts "50 Items"
# 50.times do
#   Item.create(:title => Faker::Lorem.sentence(word_count = 1), :price => 200.80, :brand_id => 1, :likes_count => 200)
# end

Area.create([
  {:name => "西单", :position => "1"}, 
  {:name => "朝阳", :position => "2"}, 
  {:name => "中关村", :position => "3"}, 
  {:name => "王府井/东单", :position => "4"},
  {:name => "大望路", :position => "5"},
  {:name => "三里屯", :position => "6"},
  {:name => "建外大街", :position => "7"},
  {:name => "建外大街", :position => "8"},
  {:name => "崇文门", :position => "9"}]
)

Category.create([
  {:name => "商场", :position => "1"}, 
  {:name => "美食", :position => "2"}, 
  {:name => "专卖店", :position => "3"}, 
  {:name => "电子商务", :position => "4"},
  {:name => "化妆品", :position => "5"},
  {:name => "折扣店", :position => "6"},
  {:name => "团购", :position => "7"}]
)

puts "aaa@123.com sysmsg for 50"
50.times do
  Message.create(:user_id => 1, :sysmsg => true, :title => "测试标题长度", :content => "文字文字"*20)
end

puts "aaa@123.com msg from other for 50"
20.times do
  Message.create(:user_id => 1, :send_by => 2,  :title => "好友私信测试标题长度", :content => "文字文字"*20)
end
20.times do
  Message.create(:user_id => 1, :send_by => 3,  :title => "好友私信测试标题长度", :content => "文字文字"*20)
end

puts "10 brands"
Brand.create([
    {:name => "特步"},
    {:name => "NBA"},
    {:name => "CBA"},
    {:name => "英超"},
    {:name => "美特斯邦威"},
    {:name => "锐步"},
    {:name => "蒙牛"},
    {:name => "马自达"}
  ])
brands = Brand.find([1,2,3])
User.first.update_attribute(:role, 3)
User.first.brands = brands

puts "items in store"
i = 1000
20.times do
  Item.create(:title => "商品测试#{i}", :unique_id => "UID#{i}", :state => 2, :store => true, :brand_id => 1)
  i += 1
end
m = 0
5.times do
  Item.create(:title => "个人商品#{m}", :unique_id => "UID#{m}", :state => 2, :store => true, :user_id => 1, :brand_id => 1)
  m += 1
end

puts "articles"
50.times do
  a = Article.create(:title => "aaa", :user_id => 1, :state => 2, :poster => open(Rails.root.join('tmp', "tmp#{rand(6)}.jpg")))
  i = rand(5)
  comments = []
  i.times do
    comments << Comment.create(:user_id => 2, :state => 2, :content => "文字"*20 )
  end
  a.comments << comments
end


