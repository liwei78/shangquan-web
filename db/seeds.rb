#encoding: utf-8
# rand(7), include 0...7, uninclude 7.


# test account
puts "Create Test Account"
User.create([
  {:email => "aaa@123.com", :name => "AAA", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar1.jpg"))},
  {:email => "bbb@123.com", :name => "BBB", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar2.jpg"))},
  {:email => "ccc@123.com", :name => "CCC", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar3.jpg"))}]
)

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
    {:name => "OLAY", :logo => open(Rails.root.join('tmp', "brand1.jpg"))},
    {:name => "欧莱雅", :logo => open(Rails.root.join('tmp', "brand2.jpg"))},
    {:name => "姬芮", :logo => open(Rails.root.join('tmp', "brand3.jpg"))},
    {:name => "美宝莲", :logo => open(Rails.root.join('tmp', "brand4.jpg"))},
    {:name => "花花公子", :logo => open(Rails.root.join('tmp', "brand5.jpg"))},
    {:name => "金利来", :logo => open(Rails.root.join('tmp', "brand6.jpg"))},
    {:name => "卡帕", :logo => open(Rails.root.join('tmp', "brand7.jpg"))},
  ])
brands = Brand.find([1,2,3])
User.first.update_attribute(:role, 3)
User.first.brands = brands

puts "items in store"
i = 1000
50.times do
  Item.create(:title => "商品测试#{i}", :unique_id => "UID#{i}", :state => 2, :store => true, :brand_id => rand(7))
  i += 1
end
m = 0
5.times do
  Item.create(:title => "个人商品#{m}", :unique_id => "UID#{m}", :state => 2, :store => true, :user_id => 1, :brand_id => 1, :poster => open(Rails.root.join('tmp', "item#{rand(5)}.jpg")))
  m += 1
end

comment_array = ["我太喜欢这个了，强烈推荐给大家。", "有写什么牌子吗？", "这个风格很适合你！", "好漂亮啊。哇咔咔。", "好可爱呀~"]
titles_array = [
  "这是一款超漂亮的欧莱雅化妆包。一些长款的化妆品都可以放的，以前那些长款睫毛膏，唇彩，化妆镜，放不进的烦恼一去不返啦，嘿嘿。而且材质也很柔软呢，放在包包里，梳妆台上都是不错的选择~ 特别推荐给大家",
  "现代简约水晶灯客厅卧室餐厅灯吸顶灯饰灯具",
  "IZZUE风 燕尾下摆 大连帽长风衣 男★加厚毛内胆两色",
  "日系杂志款条纹拼接不对称连帽男士长袖牛仔衬衫",
  "欧美范真丝亚麻男士修身T恤"]
puts "articles"
10.times do
  a = Article.create(:title => titles_array[rand(4)], :user_id => 1, :state => 2, :poster => open(Rails.root.join('tmp', "tmp#{rand(7)}.jpg")), :is_article => true)
  i = rand(5)
  comments = []
  i.times do
    comments << Comment.create(:user_id => 2, :state => 2, :content => comment_array[rand(4)] )
  end
  photos = []
  i.times do
    photos << Photo.create(:file => open(Rails.root.join('tmp', "photo#{rand(7)}.jpg")) )
  end
  a.update_attribute(:is_photo, true) if i > 0
  a.photos = photos
  a.comments = comments
end


