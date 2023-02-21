# Paired with Josh Neuwford

require 'diary'
require 'diary_entry'

RSpec.describe "Diary Entry Integration" do
  context "Adds diary entries" do
    before do
      @diary = Diary.new
      @entry1 = DiaryEntry.new("Entry one", "This is my first entry")
      @entry2 = DiaryEntry.new("Entry two", "This is my second entry")
      @diary.add(@entry1)
      @diary.add(@entry2)
    end  
      it "Returns a list of arrays" do
        expect(@diary.all).to eq [@entry1, @entry2]
      end
       
      it "Returns the word count of each entry" do
        expect(@diary.count_words).to eq 10
      end
    
      it "Returns reading time 5 for 10 words" do
        expect(@diary.reading_time(2)).to eq 5
      end
      
     it "Returns reading time 6 min for 11 words" do
        entry3 = DiaryEntry.new("Entry three", "Josh")
        @diary.add(entry3)
        expect(@diary.reading_time(2)).to eq 6
      end
  end

  context "Adds diary entries of different lengths" do
    it "returns the total reading time" do
      diary = Diary.new
      entry1 = DiaryEntry.new("entry 1", ("one two three four five"))
      entry2 = DiaryEntry.new("entry 2", ("one two three"))
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(1)).to eq 8
    end

    it 'returns the entry with the closest read time given' do
      diary = Diary.new
      entry1 = DiaryEntry.new("entry 1", "one two three four five")
      entry2 = DiaryEntry.new("entry 2", "one two")
      diary.add(entry1)
      diary.add(entry2)
      result =  diary.find_best_entry_for_reading_time(1, 3)
      expect(result).to eq entry2     
    end

    it 'returns the entry with the closest read time given' do
      diary = Diary.new
      entry1 = DiaryEntry.new("entry 1", "one two three four five")
      entry2 = DiaryEntry.new("entry 2", "one two")
      entry3 = DiaryEntry.new("entry 1", "one two three four five six seven eight nine")
      entry4 = DiaryEntry.new("entry 1", "one two three four five six")

      diary.add(entry1)
      diary.add(entry2)
      diary.add(entry3)
      diary.add(entry4)
      result =  diary.find_best_entry_for_reading_time(1, 6)
      expect(result).to eq entry4   
    end

  end

end
