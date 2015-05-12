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

get('/admin/surveys') do
  @surveys = Survey.all.sort
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

patch('/admin/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  title = params.fetch('title')
  @survey.update({:title => title})
  @surveys = Survey.all.sort
  erb(:surveys)
end

get('/admin/questions/:id') do
  @question = Question.find(params.fetch('id').to_i)
  @survey = Survey.find(@question.survey_id)
  @questions = @survey.questions()
  erb(:question_edit)
end

patch('/admin/questions/:id') do
  @question = Question.find(params.fetch('id').to_i)
  @survey = Survey.find(@question.survey_id)
  @questions = @survey.questions()
  description = params.fetch('description')
  @question.update({:description => description})
  erb(:survey_edit)
end

get('/user/surveys') do
  @surveys = Survey.all.sort
  @user = true
  erb(:surveys)
end
