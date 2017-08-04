class TaskRepository < Hanami::Repository
  def by_importance
    tasks
      .order(:importance)
      .to_a
  end
  
  def search(string)
    tasks
      .where { Sequel.lit("UPPER(title) LIKE UPPER('%#{string.raw["task"]["title"]}%') OR UPPER(description) LIKE UPPER('%#{string.raw["task"]["description"]}%')") }
      .order(:importance)
      .to_a
  end
end
