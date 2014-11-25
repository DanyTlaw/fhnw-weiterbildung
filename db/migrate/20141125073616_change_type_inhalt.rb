class ChangeTypeInhalt < ActiveRecord::Migration
  def change
    change_column :courses, :inhalt, :text
  end
end
