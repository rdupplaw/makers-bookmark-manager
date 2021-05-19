# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'A user can add a bookmark' do
    visit('/bookmarks/new')

    fill_in('title', with: 'test title')
    fill_in('url', with: 'http://www.test.com')
    click_button('submit')

    expect(page).to have_content('test title')
  end
end
