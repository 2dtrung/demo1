class AddColumnToForm2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :form2s, :name, :string
    remove_column :form2s, :company_name, :string
    remove_column :form2s, :tax_code, :string
    remove_column :form2s, :address, :string
    remove_column :form2s, :position, :string
  end
end
