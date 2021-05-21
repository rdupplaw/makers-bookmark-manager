# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '::all' do
    it 'returns an array of all bookmarks' do
      # Add the test data
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '::create' do
    it 'adds a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.test.com', title: 'test title')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'test title'
      expect(bookmark.url).to eq 'http://www.test.com'
    end

    context 'when given an invalid URL' do
      it 'does not add a bookmark' do
        Bookmark.create(url: 'htp://ww.tes,45', title: 'test title')
        expect(Bookmark.all).to be_empty
      end
    end
  end

  describe '::delete' do
    it 'deletes a bookmark' do
      bookmark1 = Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      bookmark2 = Bookmark.create(url: 'http://www.google.com', title: 'Google')

      Bookmark.delete(id: bookmark1.id)
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(1)
      expect(bookmarks.first.id).to eq(bookmark2.id)
      expect(bookmarks.first.title).to eq(bookmark2.title)
      expect(bookmarks.first.url).to eq(bookmark2.url)
    end
  end

  describe '::update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

      updated_bookmark = Bookmark.update(id: bookmark.id, title: 'Makers', url: 'https://makers.tech')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Makers'
      expect(updated_bookmark.url).to eq 'https://makers.tech'
    end
  end

  describe '::find' do
    it 'returns a specific bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a(Bookmark)
      expect(result.id).to eq(bookmark.id)
      expect(result.title).to eq('Makers Academy')
      expect(result.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '#comments' do
    it 'returns all comments relating to the bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      DatabaseConnection.query("INSERT INTO comments (id, text, bookmark_id) VALUES (1, 'test comment', #{bookmark.id})")

      comments = bookmark.comments

      expect(comments.first['id']).to eq('1')
      expect(comments.first['text']).to eq('test comment')
      expect(comments.first['bookmark_id']).to eq('1')
    end
  end
end
