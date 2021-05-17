feature 'Viewing bookmarks' do
  scenario 'User can view bookmarks' do
    visit '/bookmarks'

    expect(page).to have_content('Bookmarks')
  end
end
