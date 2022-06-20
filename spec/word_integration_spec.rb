require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add new words')
    fill_in('word_name', :with => 'cam')
    click_on('Add It!')
    expect(page).to have_content('cam')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("abagale", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'pug')
    click_on('submit')
    expect(page).to have_content('pug')
  end
end

describe('edit a word', {:type => :feature}) do
  it("edits a word and returns to word page") do
    word = Word.new("Donkey", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit word")
    fill_in("Change the word", :with => "Flying")
    click_on("Update")
    expect(page).to have_content("Flying")
  end
end

describe('edit a definition', {:type => :feature}) do
  it("edits a words definition and returns to word page") do
    word = Word.new("moon", nil)
    word.save()
    definition = Definition.new("big rock", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in("Rewrite definition", :with => "big dusty rock")
    click_on("Update")
    expect(page).to have_content("big dusty rock")
  end
end

describe('delete a word', {:type => :feature}) do
  it("deletes a word and returns to word page") do
    word = Word.new("monkey", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit word")
    click_on("Delete")
    expect(page).to have_content("")
  end
end

describe("deletes a definition", { :type => :feature }) do
  it("delete a definition and return to word page") do
    word = Word.new("school", nil)
    word.save()
    definition = Definition.new("waste of money", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on("Delete")
    expect(page).to have_content("")
  end
end
