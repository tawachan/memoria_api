class ChangeColumnStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :todos, :status, :integer, default: 0
  end
end
