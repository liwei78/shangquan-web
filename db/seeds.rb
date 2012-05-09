#encoding: utf-8

puts "Default data"

Area.create([
  {:name => "西单",       :position => 1}, 
  {:name => "朝阳",       :position => 2}, 
  {:name => "中关村",     :position => 3}, 
  {:name => "王府井/东单", :position => 4},
  {:name => "大望路",     :position => 5},
  {:name => "三里屯",     :position => 6},
  {:name => "建外大街",   :position => 7},
  {:name => "崇文门",     :position => 8}
])

Category.create([
  {:name => "品牌", :position => 1},
  {:name => "商场", :position => 2},
  {:name => "商家", :position => 3},  
  {:name => "餐饮", :position => 4}, 
  {:name => "团购", :position => 5},
  {:name => "电商", :position => 6},
])

Channel.create([
  {:name => "化妆品", :position => 1},
  {:name => "男装", :position => 2}, 
  {:name => "女装", :position => 3}, 
  {:name => "鞋帽", :position => 4},
])

HotTag.create([
  {:name => "晒单", :position => 1},
  {:name => "自拍", :position => 2},
  {:name => "逛街", :position => 3},
])

# test account
puts "Create Test Account"
User.create([
  {:email => "aaa@123.com", :name => "AAA", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar1.jpg"))},
  {:email => "bbb@123.com", :name => "BBB", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar2.jpg")), :star => true, :suggest => true, :intro => "轻微强迫症和严重妄想症，依赖快门按下时的存在感。不拘小节但专注细节。终极目标"},
  {:email => "ccc@123.com", :name => "CCC", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar3.jpg")), :todaystar => true, :intro => "外表时尚，内心保守派，喜欢新鲜有趣的事物，梦想当一名时装设计师。爱尝试各种搭"},
  {:email => "ddd@123.com", :name => "DDD", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar4.jpg")), :star => true, :suggest => true, :intro => "一枚爱流浪的巨蟹座文艺女青年。卖文为生，海边的咖啡店主，酒、音乐、文字都是生"},
  {:email => "eee@123.com", :name => "EEE", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar5.jpg")), :star => true, :suggest => true, :intro => "80后，靠谱女青年，护肤达人，喜欢各种美好的东西，简单叙述生活中的点点滴滴。"},
  {:email => "fff@123.com", :name => "FFF", :password => "1234", :password_confirmation => "1234", :avatar => open(Rails.root.join('tmp', "avatar6.jpg")), :star => true, :suggest => true, :intro => "不宅会死星人，萝莉脸爷们心，总在搜寻一切搞怪重口味，vintage格子制服复"}])


aaa = User.find 1
bbb = User.find 2
ccc = User.find 3
puts "ccc follow bbb"
ccc.follow!(bbb)
puts "aaa follow ccc"
aaa.follow!(ccc)
puts "ccc is test account, login with it."


# puts "Archetypes"
Archetype.create([
    {:name => "OLAY", :logo => open(Rails.root.join('tmp', "brand1.jpg")),  :category_id => 1, :channel_id => 1, :intro => "玉兰油（OLAY）是中国区最大护肤品牌，在大陆已持续十年呈两位数增长。它是宝洁公司全球著名的护肤品牌，OLAY以全球高科技护肤研发技术为后盾，在深入了解中国女性对护肤和美的需要的基础上，不断扩大产品范围，目前已经涵盖了护肤和沐浴系列，真正帮助女性全面周到地呵护自己的肌肤。"},
    {:name => "欧莱雅", :logo => open(Rails.root.join('tmp', "brand2.jpg")), :category_id => 1, :channel_id => 1, :intro => "这是它的介绍。"},
    {:name => "姬芮", :logo => open(Rails.root.join('tmp', "brand3.jpg")),   :category_id => 1, :channel_id => 1, :intro => "这是它的介绍。"},
    {:name => "美宝莲", :logo => open(Rails.root.join('tmp', "brand4.jpg")), :category_id => 1, :channel_id => 1, :intro => "这是它的介绍。"},
    {:name => "花花公子", :logo => open(Rails.root.join('tmp', "brand5.jpg")), :category_id => 1, :channel_id => 1, :intro => "这是它的介绍。"},
    {:name => "金利来", :logo => open(Rails.root.join('tmp', "brand6.jpg")), :category_id => 1, :channel_id => 1, :intro => "这是它的介绍。"},
    {:name => "卡帕", :logo => open(Rails.root.join('tmp', "brand7.jpg")),   :category_id => 1, :channel_id => 1, :intro => "这是它的介绍。"},

    {:name => "hq尚客", :logo => open(Rails.root.join('tmp', "com4.jpg")), :category_id => 3, :intro => "这是它的介绍。"},
    {:name => "天虹", :logo => open(Rails.root.join('tmp', "com6.jpg")), :category_id => 3, :intro => "这是它的介绍。"},
    
    {:name => "大悦城", :logo => open(Rails.root.join('tmp', "com1.jpg")), :category_id => 2, :intro => "这是它的介绍。", :area_id => 1},
    {:name => "国泰百货", :logo => open(Rails.root.join('tmp', "com2.jpg")), :category_id => 2, :intro => "这是它的介绍。", :area_id => 1},
    {:name => "新世界", :logo => open(Rails.root.join('tmp', "com3.jpg")), :category_id => 2, :intro => "这是它的介绍。", :area_id => 1},
    {:name => "西单商场", :logo => open(Rails.root.join('tmp', "com5.jpg")), :category_id => 2, :intro => "这是它的介绍。", :area_id => 1},
    {:name => "五彩城", :logo => open(Rails.root.join('tmp', "com7.jpg")), :category_id => 2, :intro => "这是它的介绍。", :area_id => 1},
    {:name => "世茂百货", :logo => open(Rails.root.join('tmp', "com8.jpg")), :category_id => 2, :intro => "这是它的介绍。", :area_id => 1},
    
    {:name => "东方饺子王", :logo => open(Rails.root.join('tmp', "jiaoziwang.jpg")), :category_id => 4, :intro => "", :area_id => 1},
])


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
  a = Article.create(:content => titles_array[rand(4)], :user_id => 1, :state => 2, :poster => open(Rails.root.join('tmp', "tmp#{rand(7)}.jpg")), :is_article => true, :is_company => true)
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
  :top => true,
  :status => 1,
  :latitude => "3990876",
  :longitude => "11639742"
)

category = Category.find(1)
category.items = Item.limit(6)

Activity.create([
  {:title => "我有一颗玻璃心", 
  :opening_date => "活动日期：3月26日-4月1日",
  :poster => open(Rails.root.join('tmp', "slider1.jpg")),
  :status => 1,
  :latitude => "3990876",
  :longitude => "11639742"},
  
  {:title => "男人的第二张名片", 
  :opening_date => "活动日期：3月26日-4月1日",
  :poster => open(Rails.root.join('tmp', "slider2.jpg")),
  :status => 1,
  :latitude => "3990876",
  :longitude => "11639742"},
  
  {:title => "波点控", 
  :opening_date => "活动日期：3月26日-4月1日",
  :poster => open(Rails.root.join('tmp', "slider3.jpg")),
  :status => 1,
  :latitude => "3990876",
  :longitude => "11639742"},
  
  {:title => "个性迷彩", 
  :opening_date => "活动日期：3月26日-4月1日",
  :poster => open(Rails.root.join('tmp', "slider4.jpg")),
  :status => 1,
  :latitude => "3990876",
  :longitude => "11639742"},
])

puts "banners"
Banner.create([
    {:title => "我有一颗玻璃心",  :gourl => "/activities/2", :position => 1, :category => 0, :poster => open(Rails.root.join('tmp', "slider1.jpg"))},
    {:title => "男人的第二张名片", :gourl => "/activities/3", :position => 2, :category => 0, :poster => open(Rails.root.join('tmp', "slider2.jpg"))},
    {:title => "波点控",  :gourl => "/activities/4", :position => 3, :category => 0, :poster => open(Rails.root.join('tmp', "slider3.jpg"))},
    {:title => "个性迷彩", :gourl => "/activities/5", :position => 4, :category => 0, :poster => open(Rails.root.join('tmp', "slider4.jpg"))},
    
    {:title => "天天排队 惊喜免费",       :summary => "好礼不停，0元抢小米手机啦！",       :gourl => "/pages/5", :position => 1, :category => 1},
    {:title => "平底鞋也完胜",         :summary => "爱美也要顾性命，平底鞋是必备良品",   :gourl => "/pages/6", :position => 2, :category => 1},
    {:title => "武装到手指",       :summary => "要讲究，就要连指甲都无懈可击", :gourl => "/pages/7", :position => 3, :category => 1},
    {:title => "来美寻，怎么玩？猛击这里！", :summary => "快速分享你喜欢的商品",     :gourl => "/pages/8", :position => 4, :category => 1}
  ])

puts "pages"
Page.create([
  {:title => "网站帮助", :content => "", :category_id => 0},
  {:title => "关于我们", :content => "", :category_id => 0},
  {:title => "联系我们", :content => "", :category_id => 0},
  {:title => "版权声明", :content => "", :category_id => 0},
  
  {:title => "天天排队 惊喜免费", :content => "好礼不停，0元抢小米手机啦！", :category_id => 2},
  {:title => "平底鞋也完胜", :content => "爱美也要顾性命，平底鞋是必备良品", :category_id => 2},
  {:title => "武装到手指", :content => "要讲究，就要连指甲都无懈可击", :category_id => 2},
  {:title => "来美寻，怎么玩？猛击这里！", :content => "快速分享你喜欢的商品", :category_id => 2},
])

puts "score"
Score.create([
  {:flag => "login", :intro => "用户登陆", :point => 5},
  {:flag => "create", :intro => "用户注册", :point => 10},
  {:flag => "postshare", :intro => "用户发表分享", :point => 5},
  ])