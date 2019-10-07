require 'sinatra/base'
require_relative './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/' do
    # 'All bookmarks'
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.show_all
    erb(:bookmarks)
  end



run! if app_file == $0

end
