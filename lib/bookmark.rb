# frozen_string_literal: true

require 'pg'

# Imports bookmarks from database
class Bookmark
  def self.all
    database_name = if ENV['RACK_ENV'] == 'test'
                      'bookmark_manager_test'
                    else
                      'bookmark_manager'
                    end

    con = PG.connect dbname: database_name

    rs = con.exec 'SELECT * FROM bookmarks'

    rs.map { |bookmark| bookmark['url'] }
  end
end
