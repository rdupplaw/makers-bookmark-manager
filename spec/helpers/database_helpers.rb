# frozen_string_literal: true

def wipe_table
  con = PG.connect dbname: 'bookmark_manager_test'
  con.exec 'DROP TABLE IF EXISTS bookmarks'
  con.exec 'CREATE TABLE bookmarks (title VARCHAR(60), id SERIAL PRIMARY KEY, url VARCHAR(60));'
end

def add_test_bookmarks
  con = PG.connect dbname: 'bookmark_manager_test'

  con.exec "INSERT INTO bookmarks (title, url) VALUES ('search', 'http://www.google.com');"
  con.exec "INSERT INTO bookmarks (title, url) VALUES ('cool bootcamp', 'http://www.makersacademy.com');"
  con.exec "INSERT INTO bookmarks (title, url) VALUES ('tutorials', 'http://www.destroyallsoftware.com');"
end
