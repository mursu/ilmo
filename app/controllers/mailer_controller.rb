class MailerController < ApplicationController
  def show
    
  end
  
  def create
    users = User.with_email
    
    
    users.each do |u|
      UserMailer.deliver_send_mail(u, params[:subject], params[:body])
    end
    
    render :text => 'Onnistui. weee'
  end
end
