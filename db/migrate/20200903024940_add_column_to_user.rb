class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :time_work, :string
    add_column :users, :job, :string
  end
end
