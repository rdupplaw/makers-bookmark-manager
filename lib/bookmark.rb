# frozen_string_literal: true

require 'pg'

# Imports bookmarks from database
class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    database_name = if ENV['RACK_ENV'] == 'test'
                      'bookmark_manager_test'
                    else
                      'bookmark_manager'
                    end

    connection = PG.connect(dbname: database_name)

    response = connection.exec('SELECT * FROM bookmarks;')

    response.map { |bookmark| Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end

  def self.create(title:, url:)
    database_name = if ENV['RACK_ENV'] == 'test'
                      'bookmark_manager_test'
                    else
                      'bookmark_manager'
                    end

    connection = PG.connect(dbname: database_name)

    response = connection
               .exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: response[0]['id'], title: response[0]['title'], url: response[0]['url'])
  end

  def self.delete(id:)
    database_name = if ENV['RACK_ENV'] == 'test'
                      'bookmark_manager_test'
                    else
                      'bookmark_manager'
                    end

    connection = PG.connect(dbname: database_name)

    connection.exec("DELETE FROM bookmarks WHERE id=#{id};")
  end

  def self.update(id:, title:, url:)
    database_name = if ENV['RACK_ENV'] == 'test'
                      'bookmark_manager_test'
                    else
                      'bookmark_manager'
                    end

    connection = PG.connect(dbname: database_name)

    response = connection
               .exec("UPDATE bookmarks SET title='#{title}', url='#{url}' WHERE id='#{id}' RETURNING id, title, url;")
    Bookmark.new(id: response[0]['id'], title: response[0]['title'], url: response[0]['url'])
  end
end
