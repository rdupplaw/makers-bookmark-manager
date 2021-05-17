feature "index page" do
  scenario "has content" do
    wipe_table
    visit '/'
    expect(page).to have_content("Bookmark Manager")
  end
end
