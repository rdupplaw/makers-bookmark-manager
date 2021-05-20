# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/bookmarks'
    click_button("delete#{bookmark.id}")

    expect(page).not_to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
