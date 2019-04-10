#Old test
#feature 'Adding a new bookmark' do
#  scenario 'A user can add a bookmark to Bookmark Manager' do
#    visit('/bookmarks/new')
#    fill_in('url', with: 'http://www.testbookmark.com')
#    click_button('submit')
#
#    expect(page).to have_content 'http://www.testbookmark.com'
#  end
#end

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('submit')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
