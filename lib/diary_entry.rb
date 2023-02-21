# Paired with Josh Neuwford

class DiaryEntry
    def initialize(title, contents)
      @title = title
      @contents = contents
      @furthest_point_reached = 0
    end
  
    def title  
        @title
    end
  
    def contents
       @contents
    end
  
    def count_words
      @contents.split(" ").count
    end
  
    def reading_time(wpm)

        fail "This is not a proper reading time" if wpm == 0

        if count_words == 1 
            return 1
        else 
            return (count_words / wpm.to_f).ceil
        end
        
    end

    def reading_chunk(wpm, minutes) 
        words_to_read = wpm * minutes
        start = @furthest_point_reached
        end_at = @furthest_point_reached + words_to_read 
        chunk = @contents.split[start...end_at].join(" ")
        @furthest_point_reached = end_at
        return chunk
    end

end