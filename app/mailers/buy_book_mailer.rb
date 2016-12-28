class BuyBookMailer < ApplicationMailer
  def mail_to_user user
    @user = user
    mail to: @user.email, subject: t("request")
  end

  def mail_to_admin admin
    @admin = admin
    mail to: @admin.email, subject: t("request")
  end
end
