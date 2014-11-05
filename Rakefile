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


  desc 'get the words'
  task :get_words do

    require 'httparty'
    require 'nokogiri'

    url = "http://www.dictionaryapi.com/api/v1/references/sd2/xml/school?key=787fcbd7-52ea-4503-b1f9-cbda88058466"

    api_response = HTTParty.get(url)
    require 'active_support/core_ext/hash/conversions'
    hash = Hash.from_xml(api_response)

  end

end