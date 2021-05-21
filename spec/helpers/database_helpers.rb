# frozen_string_literal: true

def wipe_table
  con = PG.connect dbname: 'bookmark_manager_test'
  con.exec 'DROP TABLE IF EXISTS bookmarks, comments'
  con.exec 'CREATE TABLE bookmarks (title VARCHAR(60), id SERIAL PRIMARY KEY, url VARCHAR(60));'
  con.exec 'CREATE TABLE comments (id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));'
end

def persisted_data(id:)
  PG.connect(dbname: 'bookmark_manager_test')
    .query("SELECT * FROM bookmarks WHERE id = #{id};")
end
