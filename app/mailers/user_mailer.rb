class UserMailer < ApplicationMailer

 def account_activation(user)
    @user = user
    mail to: user.email, subject: "Aktywuj swoje konto w sklepie Watch4Men!"
 end

 def password_reset(user)
    @user = user
    mail to: user.email, subject: "Reset hasła"
 end

end