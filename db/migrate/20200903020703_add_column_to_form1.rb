class AddColumnToForm1 < ActiveRecord::Migration[6.0]
  def change
    remove_column :form1s, :name, :string
    remove_column :form1s, :time_work, :string
    remove_column :form1s, :job, :string
  end
end
