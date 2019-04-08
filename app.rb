require 'sinatra/base'
class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end