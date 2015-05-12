require('spec_helper')

describe(Question) do
  it('tells the survey it belongs to') do
    survey = Survey.create({:title => "Places"})
    question = Question.create({:description => "Where are you from?", :survey_id => survey.id})
    expect(question.survey()).to(eq(survey))
  end
  it('ensures the length of description to be no more than 50 characters') do
    survey = Survey.create({:title => "Places"})
    question = Question.new({:description => "W".*(51), :survey_id => survey.id})
    expect(question.save()).to(eq(false))
  end
  it('converts the description to be capitalized') do
    survey = Survey.create({:title => "Places"})
    question = Question.create({:description => "what are you doing here?", :survey_id => survey.id})
    expect(question.description()).to(eq("What are you doing here?"))
  end
end
