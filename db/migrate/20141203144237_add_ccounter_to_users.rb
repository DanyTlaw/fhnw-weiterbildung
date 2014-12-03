class AddCcounterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ccounter, :integer
  end
end
