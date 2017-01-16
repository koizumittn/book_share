class RequestMailer < ApplicationMailer

  def request_email(requester, owner, book)
    @requester = requester
    @owner = owner
    @book = book
    mail(to: @owner.email, subject: '貸し出しリクエスト')
  end

end