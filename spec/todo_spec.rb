require 'todo'

RSpec.describe Todo do
  context "Creates a task." do
    it "Marks a task as 'done'." do
      task1 = Todo.new("Go for a walk")
      expect(task1.mark_done!).to eq "Go for a walk - done"
      end
      
    it "Returns 'true' if a task is marked as 'done'" do
      task1 = Todo.new("Go for a walk")
      task1.task
      task1.mark_done!
      expect(task1.done?).to eq true
    end
  end

end