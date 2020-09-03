class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :tax_code
      t.string :address
      t.string :position

      t.timestamps
    end
    add_index :companies, :id
  end
end
