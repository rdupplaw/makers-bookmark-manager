# frozen_string_literal: true

def wipe_table
  con = PG.connect dbname: 'bookmark_manager_test'
  con.exec 'DROP TABLE IF EXISTS bookmarks'
  con.exec 'CREATE TABLE "bookmarks" ("id" SERIAL PRIMARY KEY, "url" VARCHAR(60));'
end

def add_test_bookmarks
  con = PG.connect dbname: 'bookmark_manager_test'

  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.google.com');"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');"
end
