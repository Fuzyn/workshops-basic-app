class AddEventIdToBookLoan < ActiveRecord::Migration[7.0]
  def change
    add_column :book_loans, :google_calendar_event_id, :text
  end
end
