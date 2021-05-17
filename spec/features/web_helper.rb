def wipe_table
  con = PG.connect :dbname => 'bookmark_manager_test'

  rs = con.exec "TRUNCATE TABLE bookmarks"
end

def add_test_bookmarks
  con = PG.connect :dbname => 'bookmark_manager_test'

  rs = con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.google.com');"
  rs = con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');"
  rs = con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');"
end