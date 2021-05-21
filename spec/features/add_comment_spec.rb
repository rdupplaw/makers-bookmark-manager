# frozen_string_literal: true

feature 'Adding a comment' do
  scenario 'A user can add a comment to a bookmark' do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    visit '/bookmarks'
    first('.bookmark').click_link('add comment')
    fill_in('text', with: 'test comment')
    click_button('submit')

    expect(current_path).to eq('/bookmarks')
    within('.bookmark') do
      expect(page).to have_content('test comment')
    end
  end
end
