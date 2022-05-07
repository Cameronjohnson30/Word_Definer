require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')

get('/') do
  @words = Word.all
  erb(:words)
end

get ('/words') do 
  @words = Word.all
  erb(:words)
end

post('/words') do 
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all
  erb(:words)
end

get('/words/new') do 
  erb(:new_word)
end

get('/words/:id') do 
  @words = Word.find(params[:id].to_i())
  erb(:edit_word)
end