class UserMailer < ApplicationMailer
  def loan_created_email(book_loan)
    @title = book_loan.book&.title
    @date = book_loan.due_date

    mail({
           to: book_loan.user&.email,
           subject: "Oddej ksionszke!"
         })
  end

  def due_date_notification_email(book_loan)
    @title = book_loan.book&.title
    @date = book_loan.due_date

    mail({
           to: book_loan.user&.email,
           subject: "Oddej ksionszke!"
         })
  end
end