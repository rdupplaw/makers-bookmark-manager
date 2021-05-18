# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'A user can view bookmarks' do
    add_test_bookmarks

    visit '/bookmarks'

    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end
