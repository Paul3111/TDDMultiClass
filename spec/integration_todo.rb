require 'todo'
require 'todo_list'

RSpec.describe "Manages a todo list." do
  context "When tasks list is empty" do
    it "Returns empty list when no tasks in list." do
      list1 = TodoList.new
      expect(list1.incomplete).to eq []
    end
  end

  context "When at least one task is set." do
    before do
      @list1 = TodoList.new
      @task1 = Todo.new("Go shop")
      @task2 = Todo.new("Go to the gym")
      @task3 = Todo.new("Buy flowers")
    end
    
    it "Returns task after task added." do
      @list1.add(@task1.task)
      expect(@list1.incomplete).to eq ["Go shop"]
    end

    it "Returns two new tasks after they are added." do
      @list1.add(@task1.task)
      @list1.add(@task2.task)
      expect(@list1.incomplete).to eq ["Go shop", "Go to the gym"]
    end

    it "Marks a task as 'done'." do
      @list1.add(@task1.task)
      expect(@task1.mark_done!).to eq "Go shop - done"
    end

    it "Returns a task that was marked as 'done'." do
      @list1.add(@task1.mark_done!)
      @list1.add(@task2.task)
      result = @list1.complete
      expect(result).to eq ["Go shop - done"]
    end

    it "Returns all tasks marked as 'done'." do
      @list1.add(@task1.mark_done!)
      @list1.add(@task2.mark_done!)
      @list1.add(@task3.task)
      result = @list1.complete
      expect(result).to eq ["Go shop - done", "Go to the gym - done"]
    end
    
    it "Marks all TODOs as complete." do
      @list1.add(@task1.task)
      @list1.add(@task2.task)
      @list1.add(@task3.task)
      expect(@list1.give_up!).to eq ["Go shop - done", "Go to the gym - done", "Buy flowers - done"]
    end
    
  end

end