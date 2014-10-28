class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.date :startdate
      t.date :enddate
      t.string :lecturer

      t.timestamps
    end
  end
end
