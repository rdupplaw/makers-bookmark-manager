# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '::all' do
    it 'returns an array of all bookmarks' do
      add_test_bookmarks

      bookmarks = Bookmark.all

      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end

  describe '::create' do
    it 'adds a bookmark' do
      Bookmark.create(url: 'http://www.test.com')
      expect(Bookmark.all).to include('http://www.test.com')
    end
  end
end
