require 'bunny'

module Publishers
  class LoanBookPublisher
    def initialize(message:)
      @message = message
    end

    def publish
      Publishers::Application.new(
        routing_key: 'basic_app.book_loans',
        exchange_name: 'basic_app',
        message: @message
      ).perform
    end

    def remove_loan
      Publishers::Application.new(
        routing_key: 'basic_app.remove_loans',
        exchange_name: 'basic_app',
        message: @message
      ).perform
    end
  end
end