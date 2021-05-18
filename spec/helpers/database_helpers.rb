# frozen_string_literal: true

def wipe_table
  con = PG.connect dbname: 'bookmark_manager_test'

  con.exec 'TRUNCATE TABLE bookmarks'
end

def add_test_bookmarks
  con = PG.connect dbname: 'bookmark_manager_test'

  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.google.com');"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');"
end
