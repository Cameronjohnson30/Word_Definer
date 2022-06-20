require('rspec')
require('word')
require('definition')

describe ('Word') do
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe ('#save') do
    it("saves a word") do
      word = Word.new("apple", nil)
      word.save()
      word2 = Word.new("bottom", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe ('#==') do
    it("is the same word if it has the same attributes of another word") do
      word = Word.new("Jeans", nil)
      word2 = Word.new("Jeans", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Bootswith", nil)
      word.save()
      word2 = Word.new("TheFur", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("TheFur", nil)
      word.save()
      word2 = Word.new("Lookinather", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("joke", nil)
      word.save()
      word.update("yuppie")
      expect(word.name).to(eq("yuppie"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("dragon", nil)
      word.save()
      word2 = Word.new("duck", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end
