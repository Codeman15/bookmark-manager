feature 'Deleting a bookmark' do
  scenario 'A user can delte a bookmark' do
    Bookmark.create(url: "http://makersacademy.com", title: "makers")
    visit('/bookmarks')
    expect(page).to have_link("makers", href: "http://makersacademy.com")

    first('.bookmark').click_button 'delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("makers", href: "http://makersacademy.com")
  end
end
