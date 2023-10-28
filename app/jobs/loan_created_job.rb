class LoanCreatedJob
  include Sidekiq::Job

  def perform(id)
    book = BookLoan.find(id)
    UserMailer.loan_created_email(book).deliver_now
  end
end