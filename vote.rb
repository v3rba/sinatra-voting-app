require 'yaml/store'
require 'sinatra'

class Vote < Sinatra::Base
  get '/' do
    @title = 'Добро пожаловать!'
    erb :index
  end

  post '/cast' do
    @title = 'Спасибо за голосование!'
    @vote  = params['vote']
    @store = YAML::Store.new 'votes.yml'
    @store.transaction do
      @store['votes'] ||= {}
      @store['votes'][@vote] ||= 0
      @store['votes'][@vote] += 1
    end
    erb :cast
  end

  get '/results' do
    @title = 'Results so far:'
    @store = YAML::Store.new 'votes.yml'
    @votes = @store.transaction { @store['votes'] }
    erb :results
  end

  Choices = {
    'Win' => 'Windows',
    'OSX' => 'Mac OS',
    'Min' => 'Linux Mint',
    'Ubu' => 'Linux Ubuntu',
  }
end
