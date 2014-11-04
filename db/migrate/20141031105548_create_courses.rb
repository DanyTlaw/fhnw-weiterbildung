class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :promoter
      t.string :location
      t.string :kanton
      t.string :country
      t.string :type
      t.string :certificate
      t.string :duration

      t.timestamps
    end
  end
end
