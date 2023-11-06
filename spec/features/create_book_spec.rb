require 'rails_helper'

describe 'Create book', type: :feature do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
    login_as(user)
    click_link 'Add new book'
  end

  context 'create new book' do
    Author.destroy_all
    Category.destroy_all
    Publisher.destroy_all
    10.times do
      Author.create(
        name: Faker::Name.first_name,
        surname: Faker::Name.last_name
      )
      Category.create(
        name: Faker::Book.genre
      )
      Publisher.create(
        name: Faker::Book.publisher
      )
    end
    let(:book) do
      {
        title: 'New book title',
        isbn: '303881588-8',
        year: '1997',
        page_count: '205',
        published_on: '2009-02-23',
        language: 'PL',
        author: Author.all.first.full_name,
        category: Category.all.first.name,
        publisher: Publisher.all.first.name
      }
    end

    it 'new book' do
      within '#new-book' do
        fill_in 'book[title]',	with: book[:title]
        fill_in 'book[isbn]',	with: book[:isbn]
        fill_in 'book[year]',	with: book[:year]
        fill_in 'book[page_count]',	with: book[:page_count]
        fill_in 'book[published_on]',	with: book[:published_on]
        fill_in 'book[language]',	with: book[:language]
        select(book[:author], from: "book[author_id]", match: :first)
        select(book[:category], from: "book[category_id]", match: :first)
        select(book[:publisher], from: "book[publisher_id]", match: :first)
        click_button 'Save'
      end
      expect(page).to have_content('Book was successfully created.')
    end
  end
end