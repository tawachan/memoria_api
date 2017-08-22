class AddReferenceToTodos < ActiveRecord::Migration[5.0]
  def change
    add_reference :todos, :project, foreign_key: true
  end
end
