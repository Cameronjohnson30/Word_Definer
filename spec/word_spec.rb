require('rspec')
require('word')
require('definition')

describe('#word') do

  before(:each) do 
    Word.clear()
  end

  describe('.all') do 
    it('returns an empty array when there are no words')  do 
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do 
    it('saves a word') do 
      word = Word.new('apple', nil)
      word.save()
      word2 = Word.new('bottom', nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new('Jeans', nil)
      word2 = Word.new('Jeans', nil)
      expect(word).to(eq(word2))
    end
  end
  describe('.clear') do
    it('clears all words') do
      word = Word.new('Bootswith', nil)
      word.save()
      word2 = Word.new('TheFur', nil)
      word2.save()
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word = Word.new("TheFur", nil)
      word.save()
      word2 = Word.new("Lookinather", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end