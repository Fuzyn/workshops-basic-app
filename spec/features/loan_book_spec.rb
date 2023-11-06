require 'rails_helper'

describe 'Loan book', type: :feature do
  let(:user) { create(:user) }
  let!(:book) { create(:book) }

  before do
    visit new_user_session_path
  end

  context 'loan new book' do
    it 'logs in' do
      login_as(user)
      click_link 'Books'
      find_by_id("loan-button").click

      expect(page).to have_content('Book Loan was successfully created.')
    end
  end
end