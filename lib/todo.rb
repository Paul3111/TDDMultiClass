class Todo
  def initialize(task)
    @task = task
  end

  def task
    return @task
  end

  def mark_done!
    @task = "#{@task} - done"
  end

  def done?
    @task.include?("- done") ? true : false
  end
end