require 'pg'

class Bookmarks

  def self.show_all
    if ENV['ENVIRONMENT'] == 'test'
      a_connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      a_connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = a_connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end
end
