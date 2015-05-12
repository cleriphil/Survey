require('spec_helper')

describe(Question) do
  it('tells the survey it belongs to') do
    survey = Survey.create({:title => "Places"})
    question = Question.create({:description => "Where are you from?", :survey_id => survey.id})
    expect(question.survey()).to(eq(survey))
  end
end
