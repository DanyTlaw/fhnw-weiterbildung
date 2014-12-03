class AddProfilstatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profilstatus, :integer
  end
end
