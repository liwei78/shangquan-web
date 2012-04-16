#encoding: utf-8

# test account
puts "Create Test Account"
User.create([
  {:email => "aaa@123.com", :name => "AAA", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar1.jpg")), :role => 2},
  {:email => "bbb@123.com", :name => "BBB", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar2.jpg")), :star => true, :suggest => true, :intro => "轻微强迫症和严重妄想症，依赖快门按下时的存在感。不拘小节但专注细节。终极目标"},
  {:email => "ccc@123.com", :name => "CCC", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar3.jpg")), :todaystar => true, :intro => "外表时尚，内心保守派，喜欢新鲜有趣的事物，梦想当一名时装设计师。爱尝试各种搭"},
  {:email => "ddd@123.com", :name => "DDD", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar4.jpg")), :star => true, :suggest => true, :intro => "一枚爱流浪的巨蟹座文艺女青年。卖文为生，海边的咖啡店主，酒、音乐、文字都是生"},
  {:email => "eee@123.com", :name => "EEE", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar5.jpg")), :star => true, :suggest => true, :intro => "80后，靠谱女青年，护肤达人，喜欢各种美好的东西，简单叙述生活中的点点滴滴。"},
  {:email => "fff@123.com", :name => "FFF", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar6.jpg")), :star => true, :suggest => true, :intro => "不宅会死星人，萝莉脸爷们心，总在搜寻一切搞怪重口味，vintage格子制服复"}])



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
  {:name => "品牌", :position => 1},
  {:name => "商场", :position => 2},
  {:name => "商家", :position => 3},  
  {:name => "美食", :position => 4}, 
  {:name => "专卖店", :position => 5}, 
  {:name => "电子商务", :position => 6},
  {:name => "化妆品", :position => 7},
  {:name => "折扣店", :position => 8},
  {:name => "团购", :position => 9}]
  
)

Channel.create([
  {:name => "化妆品", :position => "1"},
  {:name => "男装", :position => "2"}, 
  {:name => "女装", :position => "3"}, 
  {:name => "鞋帽", :position => "4"},
  {:name => "儿童用品", :position => "5"},
  {:name => "运动户外", :position => "6"},
  {:name => "首饰", :position => "7"}
])



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


ArchetypeType.create([
  {:name => ""}
])
Archetype.create([
    {:name => "OLAY", :logo => open(Rails.root.join('tmp', "brand1.jpg")),  :category_id => 1, :channel_id => 1, :intro => "玉兰油（OLAY）是中国区最大护肤品牌，在大陆已持续十年呈两位数增长。它是宝洁公司全球著名的护肤品牌，OLAY以全球高科技护肤研发技术为后盾，在深入了解中国女性对护肤和美的需要的基础上，不断扩大产品范围，目前已经涵盖了护肤和沐浴系列，真正帮助女性全面周到地呵护自己的肌肤。"},
    {:name => "欧莱雅", :logo => open(Rails.root.join('tmp', "brand2.jpg")), :category_id => 1, :channel_id => 1, :intro => ""},
    {:name => "姬芮", :logo => open(Rails.root.join('tmp', "brand3.jpg")),   :category_id => 1, :channel_id => 1, :intro => ""},
    {:name => "美宝莲", :logo => open(Rails.root.join('tmp', "brand4.jpg")), :category_id => 1, :channel_id => 2, :intro => ""},
    {:name => "花花公子", :logo => open(Rails.root.join('tmp', "brand5.jpg")), :category_id => 1, :channel_id => 2, :intro => ""},
    {:name => "金利来", :logo => open(Rails.root.join('tmp', "brand6.jpg")), :category_id => 1, :channel_id => 2, :intro => ""},
    {:name => "卡帕", :logo => open(Rails.root.join('tmp', "brand7.jpg")),   :category_id => 1, :channel_id => 2, :intro => ""},

    {:name => "hq尚客", :logo => open(Rails.root.join('tmp', "com4.jpg")), :category_id => 3, :intro => ""},
    {:name => "天虹", :logo => open(Rails.root.join('tmp', "com6.jpg")), :category_id => 3, :intro => ""},
    
    {:name => "大悦城", :logo => open(Rails.root.join('tmp', "com1.jpg")), :category_id => 2, :intro => "玉兰油（OLAY）是中国区最大护肤品牌，在大陆已持续十年呈两位数增长。它是宝洁公司全球著名的护肤品牌，OLAY以全球高科技护肤研发技术为后盾，在深入了解中国女性对护肤和美的需要的基础上，不断扩大产品范围，目前已经涵盖了护肤和沐浴系列，真正帮助女性全面周到地呵护自己的肌肤。"},
    {:name => "国泰百货", :logo => open(Rails.root.join('tmp', "com2.jpg")), :category_id => 2, :intro => ""},
    {:name => "新世界", :logo => open(Rails.root.join('tmp', "com3.jpg")), :category_id => 2, :intro => ""},
    {:name => "西单商场", :logo => open(Rails.root.join('tmp', "com5.jpg")), :category_id => 2, :intro => ""},
    {:name => "五彩城", :logo => open(Rails.root.join('tmp', "com7.jpg")), :category_id => 2, :intro => ""},
    {:name => "世茂百货", :logo => open(Rails.root.join('tmp', "com8.jpg")), :category_id => 2, :intro => ""},
])

puts "xidan's companies"
xidan = Area.find(1)
companies1 = Archetype.find([8,9,10,11,12])
for com in companies1
  xidan.companies << com
end
puts "dawang's companies"
dawang = Area.find(5)
companies2 = Archetype.find([13,14,15])
for cc in companies2
  dawang.companies << cc
end

puts "items in store"
i = 1000
20.times do
  Item.create(:title => "商品测试#{i}", :unique_id => "UID#{i}", :state => 2, :store => true, :brand_id => rand(7), :poster => open(Rails.root.join('tmp', "item#{rand(5)}.jpg")))
  i += 1
end


puts "index top items from official"
Item.create([
  {:title => "双肩带性感V领棉质背心", :summary => "双肩带棉质背心，性感的V字领内搭也精彩。",                             :price => 68,     :top => true, :poster => open(Rails.root.join('tmp', "itemtop1.jpg"))},
  {:title => "NINE WEST 迷人彩色花朵装饰鱼嘴设计女士高跟鞋16色", :summary => "玖熙花朵鱼嘴高跟鞋，鞋子必须要最好的。",      :price => 1550,   :top => true, :poster => open(Rails.root.join('tmp', "itemtop2.jpg"))},
  {:title => "复古青春系 走进色彩国度 完美主义 二色撞色雪纺衫", :summary => "撞色雪纺衫，2012最流行的高调撞色美学。",       :price => 79,     :top => true, :poster => open(Rails.root.join('tmp', "itemtop3.jpg"))},
  {:title => "大爱亮色，玫红", :summary => "玫红色连衣裙裤，颜色超亮叠穿效果别致。",                                    :price => 79.2,   :top => true, :poster => open(Rails.root.join('tmp', "itemtop4.jpg"))},
  {:title => "limited edition 复古图案套装", :summary => "复古图案子套装，束口领型，更有味道。",                  :price => 226.9,  :top => true, :poster => open(Rails.root.join('tmp', "itemtop5.jpg"))},
  {:title => "Kusso Molly Crazy Label Treeson Ren 阿人 5寸", :summary => "正版5寸阿仁玩偶，爱他的玩家不要错过。", :price => 350,    :top => true, :poster => open(Rails.root.join('tmp', "itemtop6.jpg"))},
])


comment_array = ["我太喜欢这个了，强烈推荐给大家。", "有写什么牌子吗？", "这个风格很适合你！", "好漂亮啊。哇咔咔。", "好可爱呀~"]
titles_array = [
  "这是一款超漂亮的欧莱雅化妆包。",
  "现代简约水晶灯客厅卧室餐厅灯吸顶灯饰灯具",
  "IZZUE风 燕尾下摆 大连帽长风衣 男★加厚毛内胆两色",
  "日系杂志款条纹拼接不对称连帽男士长袖牛仔衬衫",
  "欧美范真丝亚麻男士修身T恤"]
puts "articles"
10.times do
  a = Article.create(:title => titles_array[rand(4)], :user_id => 1, :state => 2, :poster => open(Rails.root.join('tmp', "tmp#{rand(7)}.jpg")), :is_article => true, :is_company => true)
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

puts '6 article items of articles/1'
ArticleItem.create([
  {:name => "背心", :summary => "双肩带棉质背心，性感的V字领内搭也精彩。",   :price => 68,    :user_id => 2, :top => true, :poster => open(Rails.root.join('tmp', "itemtop1.jpg"))},
  {:name => "高跟鞋", :summary => "玖熙花朵鱼嘴高跟鞋，鞋子必须要最好的。",   :price => 1550,  :user_id => 2, :top => true, :poster => open(Rails.root.join('tmp', "itemtop2.jpg"))},
  {:name => "雪纺衫", :summary => "撞色雪纺衫，2012最流行的高调撞色美学。",  :price => 79,    :user_id => 2, :top => true, :poster => open(Rails.root.join('tmp', "itemtop3.jpg"))},
  {:name => "连衣裙裤", :summary => "玫红色连衣裙裤，颜色超亮叠穿效果别致。", :price => 79.2,  :user_id => 2, :top => true, :poster => open(Rails.root.join('tmp', "itemtop4.jpg"))},
  {:name => "套装", :summary => "复古图案子套装，束口领型，更有味道。",      :price => 226.9, :user_id => 2, :top => true, :poster => open(Rails.root.join('tmp', "itemtop5.jpg"))},
  {:name => "玩偶", :summary => "正版5寸阿仁玩偶，爱他的玩家不要错过。",     :price => 350,   :user_id => 2, :top => true, :poster => open(Rails.root.join('tmp', "itemtop6.jpg"))},
])


puts "1 activity"
activity = Activity.create(
  :title => "饭，到，爱！", 
  :summary => "甭管你是饭点儿想来顿丰盛大餐，还是深夜炖锅红烧肉报复社会；也甭管你是一碗面一头蒜给个杨幂都不换的务实派，还是吃到黑松露就必须追加一碟鱼子酱才舒坦的龟毛派，此时此刻你最想吃的是什么？",
  :content => "你是一碗面一颗蒜给个杨幂都不换的务实派？还是吃到黑松露就必须追加一碟鱼子酱才舒坦的龟毛派？此时此刻你最想吃的是什么？快快晒出来呀!
  1，在这里发布你最想吃的食品图片参与活动，还可以给这些美食投票（点击图片上的喜欢）并参与评论。
  2，是吃货必须找到靠谱组织，联个盟神马的才会搜索到更多美食啊!
  参与方式（选择以下任一方式即可）：
  1，点击页面右上角“上传主题分享”按钮将你参与活动的图片上传到你的图格中即可。
  2，上传你已分享的美食图片，在描述中加入#想吃的#然后保存。
  3，使用收集工具采集网页上的美食图片，在描述中加入#想吃的#。",
  :opening_date => "活动日期：3月26日-4月1日",
  :poster => open(Rails.root.join('tmp', "activity.jpg")),
  :top => true)

category = Category.find(1)
category.items = Item.limit(6)

puts "4 banners"
Banner.create([
    {:title => "卫衣躁动史",    :gourl => "#", :position => 1, :category => 0, :poster => open(Rails.root.join('tmp', "slider1.jpg"))},
    {:title => "真男人要护肤",   :gourl => "#", :position => 2, :category => 0, :poster => open(Rails.root.join('tmp', "slider2.jpg"))},
    {:title => "我是你的明灯",   :gourl => "#", :position => 3, :category => 0, :poster => open(Rails.root.join('tmp', "slider3.jpg"))},
    {:title => "注册商圈N喜临门", :gourl => "#", :position => 4, :category => 0, :poster => open(Rails.root.join('tmp', "slider4.jpg"))},
    {:title => "0元抢小米手机",       :summary => "白拿小米第五期！上期获奖：Crazycat",  :gourl => "#", :position => 1, :category => 1},
    {:title => "脚踏两只鞋",         :summary => "女人都喜欢穿休闲鞋的男人",           :gourl => "#", :position => 2, :category => 1},
    {:title => "通勤利器撑气场",       :summary => "一个好的通勤包，绝对助你出挑",         :gourl => "#", :position => 3, :category => 1},
    {:title => "来商圈，怎么玩？猛击这里！", :summary => "快速分享你喜欢的商品",             :gourl => "#", :position => 4, :category => 1}
  ])
