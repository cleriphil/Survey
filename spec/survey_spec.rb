require('spec_helper')

describe(Survey) do
  it('returns the questions in a survey') do
    survey = Survey.create({:title => "Places"})
    question1 = Question.create({:description => "Where are you from?", :survey_id => survey.id})
    question2 = Question.create({:description => "Where would you like to go?", :survey_id => survey.id})
    expect(survey.questions()).to(eq([question1, question2]))
  end
end
