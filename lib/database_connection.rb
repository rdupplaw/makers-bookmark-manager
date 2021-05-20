# frozen_string_literal: true

require 'pg'

# Handles persistent connection to database
class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  class << self
    attr_reader :connection
  end
end
