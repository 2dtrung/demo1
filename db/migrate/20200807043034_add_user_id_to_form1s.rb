class AddUserIdToForm1s < ActiveRecord::Migration[6.0]
  def change
    add_reference :form1s, :user, null: false, foreign_key: true
  end
end
