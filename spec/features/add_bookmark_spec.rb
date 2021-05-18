# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'A user can add a bookmark' do
    visit('/bookmarks/new')

    fill_in('url', with: 'http://www.youtube.com')
    click_button('submit')

    expect(page).to have_content('http://www.youtube.com')
  end
end
