class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column(:courses, :type, :mode)
  end
end