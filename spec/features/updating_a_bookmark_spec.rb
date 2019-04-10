feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers')
    visit('/bookmarks')
    expect(page).to have_link('makers', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "http://www.snakersacademy.com")
    fill_in('title', with: "Snakers Academy")
    click_button('submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
  end
end
