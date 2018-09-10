require 'sinatra'

get '/' do
  @title = 'Добро пожаловать!'
  erb :index
end

post '/cast' do
  @title = 'Спасибо за Ваш голос!'
  @vote  = params['vote']
  erb :cast
end

get '/results' do
  @votes = { 'Win' => 7, 'OSX' => 5, 'Ubu' => 3 }
  erb :results
end

Choices = {
  'Win' => 'Windows',
  'OSX' => 'Mac OS',
  'Min' => 'Linux Mint',
  'Ubu' => 'Linux Ubuntu',
}
