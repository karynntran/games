require 'bundler'
Bundler.require
require 'sinatra/activerecord/rake'

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

  desc "Add random words"
  task :random_word do

    require './models/word'

    Word.create({body: "snow"})
    Word.create({body: "frost"})
    Word.create({body: "jingle"})
    Word.create({body: "snowman"})
    Word.create({body: "holiday"})
    Word.create({body: "sleigh"})
    Word.create({body: "bells"})
    Word.create({body: "cold"})
    Word.create({body: "flake"})
    Word.create({body: "scarf"})
    Word.create({body: "coal"})
    Word.create({body: "freeze"})
    Word.create({body: "winter"})
    Word.create({body: "wonderland"})
    Word.create({body: "merry"})
    Word.create({body: "merry"})
    Word.create({body: "gloves"})
    Word.create({body: "sledding"})

  end

  # desc "Load hangman words"
  # task :load_words do
  #   50_000.times { Word.create {}}


  # desc 'get the words'
  # task :get_words do

  #   require 'httparty'
  #   require 'active_support/core_ext/hash/conversions'

  #   querys = ['happy', 'rainbow', 'monkey']
  #   querys = ('a'..'z').to_a

  #   querys.each do |query|
  #     url = "http://www.dictionaryapi.com/api/v1/references/sd2/xml/#{ query }?key=787fcbd7-52ea-4503-b1f9-cbda88058466"

  #     api_response = HTTParty.get(url)
  #     word_data = Hash.from_xml(api_response)
  #     word_defitions = word_data["entry_list"]["entry"]
  #     words = word_defitions.map{ |word| word['id'] }

  #     words.each do |word|
  #       puts word
  #       # Word.create({body: word})
  #     end

  #   end

  # end

end