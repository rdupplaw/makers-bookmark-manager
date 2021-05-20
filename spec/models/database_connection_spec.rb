# frozen_string_literal: true

require 'database_connection'

describe DatabaseConnection do
  describe '::setup' do
    it 'connects to the database' do
      dbname = 'bookmark_manager_test'
      expect(PG).to receive(:connect).with(dbname: dbname)

      DatabaseConnection.setup(dbname)
    end
    it 'the connection is persistent' do
      dbname = 'bookmark_manager_test'

      connection = DatabaseConnection.setup(dbname)

      expect(connection).to eq(DatabaseConnection.connection)
    end
  end
end
