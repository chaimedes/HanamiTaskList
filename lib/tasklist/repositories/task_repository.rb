require 'pry'
class TaskRepository < Hanami::Repository
  def by_importance
    tasks
      .order(:importance)
      .to_a
  end
  
  def search(string)
    binding.pry
    tasks
      .where { "title LIKE 'string'" }
      .order(:importance)
      .to_a
  end
end
