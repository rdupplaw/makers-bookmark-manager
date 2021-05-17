require 'pg'

class Bookmark
  def self.all
    con = PG.connect :dbname => 'bookmark_manager'

    rs = con.exec "SELECT * FROM bookmarks"

    rs.map { |bookmark| bookmark['url'] }
  end
end
