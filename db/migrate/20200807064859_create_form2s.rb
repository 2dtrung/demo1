class CreateForm2s < ActiveRecord::Migration[6.0]
  def change
    create_table :form2s do |t|
      t.string :company_name
      t.string :tax_code
      t.string :address
      t.string :name
      t.string :position
      t.string :date
      t.string :work_des
      t.string :income
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
