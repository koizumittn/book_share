class RequestMailer < ApplicationMailer

  def request_email(requester, owner)
    @requester = requester
    @owner = owner
    mail(to: @owner.email, subject: '貸し出しリクエスト')
  end

end
