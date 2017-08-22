class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :task
      t.text :description
      t.string :page
      t.integer :status, default: 0
      t.timestamp :done_at
      t.timestamps
    end
  end
end
