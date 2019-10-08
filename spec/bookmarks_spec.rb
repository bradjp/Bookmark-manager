require 'bookmarks'

describe Bookmarks do
  bookmarks = Bookmarks.show_all
  describe '#show_all' do
    it 'shows all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.wikipedia.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.reddit.com');")

      bookmarks = Bookmarks.show_all

      expect(bookmarks).to include 'https://www.google.com'
      expect(bookmarks).to include 'https://www.wikipedia.com'
      expect(bookmarks).to include 'https://www.reddit.com'
    end
  end
end
