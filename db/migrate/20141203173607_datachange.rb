class Datachange < ActiveRecord::Migration
  def change
  	change_column :courses, :inhalt, :text
  	change_column :courses, :zielpublikum, :text
  	change_column :courses, :zulassung, :text
  	change_column :courses, :info, :text  	
  end
end
