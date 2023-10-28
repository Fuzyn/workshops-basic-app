class DueDateNotificationJob
  include Sidekiq::Job

  def perform
    BookLoan.ending_checked_out.each do |bl|
      UserMailer.due_date_notification_email(bl).deliver_now
    end
  end
end