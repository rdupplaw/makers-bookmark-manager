require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      database_name = 'bookmark_manager_test'
    else
      database_name = 'bookmark_manager'
    end

    con = PG.connect :dbname => database_name

    rs = con.exec "SELECT * FROM bookmarks"

    rs.map { |bookmark| bookmark['url'] }
  end
end
