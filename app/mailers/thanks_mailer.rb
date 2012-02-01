class ThanksMailer < ActionMailer::Base
  default from: "eschalon@gmail.com"
  
  def send_thanks(petition)
    @petition = petition
    mail(:to => "#{petition.first_name} #{petition.last_name} <#{petition.email}>", :subject => "Thank you for your support")
  end
end
