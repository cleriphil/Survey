require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/survey')
require('./lib/question')
# require('./lib/answer')
require('pg')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @surveys = Survey.all
  erb(:index)
end

get('/surveys/new') do
  erb(:survey_form)
end

post('/surveys') do
  title = params.fetch('title')
  @survey = Survey.create({:title => title})
  erb(:success)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  @questions = @survey.questions()
  erb(:survey)
end

post('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  description = params.fetch('description')
  Question.create({:description => description, :survey_id => @survey.id})
  @questions = @survey.questions()
  erb(:survey)
end
