class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.checkout_notification.subject
  #
  def checkout_notification(item, user)
    @item = item
    @user = user
    @greeting = "Howdy!"

    mail to: "murtaza.hakimi@gmail.com"
  end
end
