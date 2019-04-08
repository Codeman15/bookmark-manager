feature 'Viewing bookmarks' do
  scenario 'Visiting index page' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://www.google.com"
  end
end
