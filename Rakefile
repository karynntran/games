require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'games_db'
)

namespace :db do
  desc "Create games_db database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE games_db;')
    conn.close
  end

  # desc "Load hangman words"
  # task :load_words do
  #   50_000.times { Word.create {}}
end