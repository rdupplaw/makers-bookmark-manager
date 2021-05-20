# frozen_string_literal: true

feature 'Updating bookmarks' do
  scenario 'A user can update a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_link('edit')
    fill_in('title', with: 'my bootcamp')
    fill_in('url', with: 'https://makers.tech')
    click_button('submit')

    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('my bootcamp', href: 'https://makers.tech')
  end
end
