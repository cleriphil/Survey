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
  erb(:index)
end

get('/user/surveys') do
  @surveys = Survey.all
  @user = true
  erb(:surveys)
end

get('/admin/surveys') do
  @surveys = Survey.all
  @user = false
  erb(:surveys)
end

get('/admin/surveys/:id/edit') do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:survey_edit)
end

get('/admin/surveys/new') do
  erb(:survey_form)
end

post('/admin/surveys') do
  title = params.fetch('title')
  @survey = Survey.create({:title => title})
  erb(:success)
end

get('/admin/surveys/:id/questions') do
  @survey = Survey.find(params.fetch('id').to_i)
  @questions = @survey.questions()
  erb(:admin_survey)
end

post('/admin/surveys/:id/questions') do
  @survey = Survey.find(params.fetch('id').to_i)
  description = params.fetch('description')
  Question.create({:description => description, :survey_id => @survey.id})
  @questions = @survey.questions()
  erb(:admin_survey)
end
