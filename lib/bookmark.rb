# frozen_string_literal: true

require_relative './database_connection'

# Imports bookmarks from database
class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    response = DatabaseConnection.query('SELECT * FROM bookmarks;')
    response.map { |bookmark| Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end

  def self.create(title:, url:)
    return false unless valid_url?(url)

    response = DatabaseConnection
               .query("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: response[0]['id'], title: response[0]['title'], url: response[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id=#{id};")
  end

  def self.update(id:, title:, url:)
    response = DatabaseConnection
               .query("UPDATE bookmarks SET title='#{title}', url='#{url}' WHERE id='#{id}' RETURNING id, title, url;")
    Bookmark.new(id: response[0]['id'], title: response[0]['title'], url: response[0]['url'])
  end

  def self.find(id:)
    response = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id='#{id}';")
    Bookmark.new(id: response[0]['id'], title: response[0]['title'], url: response[0]['url'])
  end

  private_class_method def self.valid_url?(url)
    url =~ /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
  end

  def comments
    DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id=#{id}")
  end
end
