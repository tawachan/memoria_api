class AddReferenceUserToTodos < ActiveRecord::Migration[5.0]
  def change
    add_reference :todos, :user
  end
end
