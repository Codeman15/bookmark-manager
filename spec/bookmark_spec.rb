require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
   it 'returns a list of bookmarks' do
     connection = PG.connect(dbname: 'bookmark_manager_test')

     # Add the test data
     bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "makers")
     Bookmark.create(url: "http://www.twitter.com", title: "twitter")
     Bookmark.create(url: "http://www.google.com", title: "google")

     bookmarks = Bookmark.all

     expect(bookmarks.length).to eq 3
     expect(bookmarks.first).to be_a Bookmark
     expect(bookmarks.first.id).to eq bookmark.id
     expect(bookmarks.first.title).to eq 'makers'
     expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: "makers", url: "bookmark_manager_test")
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0

    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.create(title: 'makers', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'makers', url: 'http://www.makersacademy.com')
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'makers'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

  let(:comment_class) { double(:comment_class) }

  describe '#comments' do
    it 'returns a list of comments on the bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)
      bookmark.comments(comment_class)
    end
  end
end
