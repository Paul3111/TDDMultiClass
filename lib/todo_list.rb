class TodoList
  def initialize
    @task_list = []
    @finished_tasks = []
  end

  def add(todo)
    return @task_list << todo
  end

  def incomplete
    return @task_list
  end

  def complete
    @task_list.each do |current_task| 
      if current_task.include?("- done")
        @finished_tasks << current_task
      end
    end
    return @finished_tasks
  end

  def give_up!
    @task_list.each do |task|
      @finished_tasks << "#{task} - done"
    end
    return @finished_tasks
  end
end