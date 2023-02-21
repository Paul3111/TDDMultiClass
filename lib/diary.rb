# Paired with Josh Neuwford

class Diary
  def initialize
    @entries = []
  end

  def add(entry) 
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    result = 0
    @entries.each do |item|
      i = item.count_words
      result += i
    end
    return result
 
  end

  def reading_time(wpm)
    result = 0
      @entries.each do |item|
        count = (item.count_words.to_f / wpm)
        result += count
      end
      return result.ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
      closest_entry = nil
      sorted_entries = @entries.sort_by { |entry| entry.count_words }
      sorted_entries.each { |entry|
        if entry.count_words <= (wpm * minutes)
          closest_entry = entry
        end
      }
      return closest_entry
  end
end