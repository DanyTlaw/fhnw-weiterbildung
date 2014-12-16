class AllesText < ActiveRecord::Migration
  def change
  	change_column :courses, :titel, :text 
  	change_column :courses, :ort, :text
  	change_column :courses, :abschluss, :text
  	change_column :courses, :leitung, :text 
  end
end
