class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.user_notification.subject
  #
  def user_notification(user)
    @user = user
    mail(to: user.email, subject: "Premium account")
  end
end
