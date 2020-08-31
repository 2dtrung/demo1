class AddFreelanceJobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :isfreelance, :boolean
    add_column :users, :user_job, :string
  end
end
