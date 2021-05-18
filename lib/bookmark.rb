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

    connection = PG.connect(dbname: database_name)

    response = connection.exec('SELECT * FROM bookmarks;')

    response.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    database_name = if ENV['RACK_ENV'] == 'test'
                      'bookmark_manager_test'
                    else
                      'bookmark_manager'
                    end

    connection = PG.connect(dbname: database_name)

    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end
end
