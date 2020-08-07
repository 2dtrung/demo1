class CreateForm1s < ActiveRecord::Migration[6.0]
  def change
    create_table :form1s do |t|
      t.string :name
      t.string :time_work
      t.string :job
      t.string :date
      t.string :customer
      t.string :income
      t.string :work_des

      t.timestamps
    end
  end
end
