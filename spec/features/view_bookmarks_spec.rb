feature 'Viewing bookmarks' do
  scenario 'User can view bookmarks' do
    visit '/bookmarks'

    expect(page).to have_content('https://www.google.com')
    expect(page).to have_content('https://www.makersacademy.com')
    expect(page).to have_content('https://www.twitter.com')
  end
end
