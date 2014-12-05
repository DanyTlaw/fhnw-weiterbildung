class AddDuesendToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :duesend, :boolean
  end
end
