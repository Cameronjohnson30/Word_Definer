require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words/new')
    fill_in('word_name', :with => 'Yellow Submarine')
    click_on('Add It!')
    expect(page).to have_content('Yellow Submarine')
  end
end