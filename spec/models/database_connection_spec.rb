# frozen_string_literal: true

require 'database_connection'

describe DatabaseConnection do
  let(:dbname) { 'bookmark_manager_test' }
  describe '::setup' do
    it 'connects to the database via PG' do
      expect(PG).to receive(:connect).with(dbname: dbname)

      DatabaseConnection.setup(dbname)
    end

    it 'the connection is persistent' do
      connection = DatabaseConnection.setup(dbname)

      expect(connection).to eq(DatabaseConnection.connection)
    end
  end

  describe '::query' do
    it 'queries the database via PG' do
      connection = DatabaseConnection.setup(dbname)
      expect(connection).to receive(:exec).with('SELECT * FROM bookmarks LIMIT 10')

      DatabaseConnection.query('SELECT * FROM bookmarks LIMIT 10')
    end
  end
end
