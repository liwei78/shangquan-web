# encoding: utf-8
namespace(:daily) do
  
  desc "Clear All PhotoTemp Files for Item Uploads"
  task(:clear_photo_temp => :environment) do
    PhotoTemp.destroy_all
  end
  
  desc "test notice email"
  task(:testemail => :environment) do
    Mailer.notice(["hi@liwei.me", "5175486@qq.com", "liwei781106@163.com"], "这是一封测试邮件").deliver
  end
  
end