# frozen_string_literal: true

feature 'index page' do
  scenario 'has content' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end
end
