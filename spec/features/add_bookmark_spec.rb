# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'A user can add a bookmark' do
    visit('/bookmarks/new')

    fill_in('title', with: 'test title')
    fill_in('url', with: 'http://www.test.com')
    click_button('submit')

    expect(page).to have_content('test title')
  end

  context 'When the user enters an invalid URL' do
    scenario 'An error message appears' do
      visit('/bookmarks/new')

      fill_in('title', with: 'test title')
      fill_in('url', with: 'htt://www.test.cm')
      click_button('submit')

      expect(current_path).to eq('/bookmarks')
      expect(page).not_to have_link('test title', href: 'htt://www.test.cm')
      expect(page).to have_content('Error: Invalid URL')
    end
  end
end
