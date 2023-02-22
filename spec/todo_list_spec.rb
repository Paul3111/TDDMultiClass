require 'todo_list'

RSpec.describe TodoList do
  context "Displays a list of TODOs." do
    it "Adds a taks to the list" do
      list1 = TodoList.new
      list1.add("First todo task")
      expect(list1.incomplete).to eq ["First todo task"]
    end
      
    it "Displays two tasks marked as completed." do
      list1 = TodoList.new
      list1.add("First todo task - done")
      list1.add("Second task")
      list1.add("Third task - done")
      expect(list1.complete).to eq ["First todo task - done", "Third task - done"]
    end
  end
end