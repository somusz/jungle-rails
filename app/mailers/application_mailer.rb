class ApplicationMailer < ActionMailer::Base
  #mailer application with the default from email address
  default from: "no-reply@jungle.com"
  layout 'mailer'
end
