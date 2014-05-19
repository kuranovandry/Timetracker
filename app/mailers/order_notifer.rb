class OrderNotifer < ActionMailer::Base
  default from: "Sam Ruby <depot@example.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifer.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Confirmation of the order in Pragmatic Store'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifer.shipped.subject
  #
  def shipped
    @order = order

    mail to: order.email, subject: 'Order of Pragmatic Store sent'
  end
end
