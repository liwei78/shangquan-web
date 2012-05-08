class Mailer < ActionMailer::Base
  
  def notice(emails, content)
    @body = content
    @url  = "shangquan.com"
    mail(
      :from => SITE_SETTINGS['mail']['user_name'],
      :to => emails,
      :subject => SITE_SETTINGS['mail']['title']
      ) do |format|
    end
  end

end
