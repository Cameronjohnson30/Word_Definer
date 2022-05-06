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
end