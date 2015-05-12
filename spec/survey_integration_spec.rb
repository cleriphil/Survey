require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to the homepage', {:type => :feature}) do
  it('displays a list of surveys and an add survey link') do
    visit('/')
    expect(page).to have_content('Take a Survey...')
    expect(page).to have_content('Create a Survey')
  end
end

# describe('the path to the form to create a survey', {:type => :feature}) do
#   it('displays a form for the user to create a survey') do
#     visit('/')
#     click_on('Create a Survey')
#     fill_in('title', :with => 'Places')
#     click_button('Create')
#     fill_in('question', :with => 'Where have you been?')
#     click_button('Add')
#   end
# end
