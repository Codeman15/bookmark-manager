feature 'viewing bookmarks' do
  scenario 'bookmarks are visible' do

    Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers')
    Bookmark.create(url: 'http://www.twitter.com', title: 'twitter')
    Bookmark.create(url: 'http://www.google.com', title: 'google')

    visit '/bookmarks'

    expect(page).to have_link('makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('twitter',  href: 'http://www.twitter.com')
    expect(page).to have_link('google', href: 'http://www.google.com')
    end
  end
