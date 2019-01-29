class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :truncated_description, :task_titles, :complete, :incomplete
  # has_many :tasks


  def truncated_description
    object.description[0..10]
  end

  def task_titles
    object.tasks.map{ |task| task.title }
  end
end
