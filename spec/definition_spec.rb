require('rspec')
require('definition')
require('word')
require('pry')

describe ('Definition') do
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("hit thefloor", nil)
    @word.save()
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      definition = Definition.new("Peacock", @word.id, nil)
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("lowlow", @word.id, nil)
      definition2 = Definition.new("lowlow", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("baggy", @word.id, nil)
      definition.save()
      definition2 = Definition.new("sweatpants", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("rebooks", @word.id, nil)
      definition.save()
      definition2 = Definition.new("withstraps", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("withstraps", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("lookinather", @word.id, nil)
      definition.save()
      definition2 = Definition.new("imdone", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new("Normal", @word.id, nil)
      definition.save()
      definition.update("testing", @word.id)
      expect(definition.name).to(eq("testing"))
    end
  end

  describe("#delete") do
    it("deletes a definition by id") do
      definition = Definition.new("almost", @word.id, nil)
      definition.save()
      definition2 = Definition.new("done", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definition of a word") do
      word2 = Word.new("Yellow", nil)
      word2.save()
      definition = Definition.new("dragon", @word.id, nil)
      definition.save()
      definition2 = Definition.new("monkey", word2.id, nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#word') do
    it("finds the word the definition belongs to") do
      definition = Definition.new("penguin", @word.id, nil)
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end
end