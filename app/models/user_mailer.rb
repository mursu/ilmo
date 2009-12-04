class UserMailer < ActionMailer::Base

  def send_mail(user, mail_subject, message_body)
    recipients user.email
    from "Ilmo2pistenolla <tsuidaduida@happosaaret.com"
    subject mail_subject
    sent_on Time.now
    body :user => user, :message_body => message_body
  end
end
