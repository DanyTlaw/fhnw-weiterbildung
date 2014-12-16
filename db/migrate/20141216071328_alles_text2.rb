class AllesText2 < ActiveRecord::Migration
  def change
  	change_column :profils, :schulname, :text
   	change_column :profils, :standort, :text 
   	change_column :profils, :fachbereich, :text	
  	change_column :profils, :info, :text
  end
end
