class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :titel
      t.string :kurstyp
      t.date :start
      t.string :anbieter
      t.string :ort
      t.integer :preis
      t.string :inhalt
      t.string :zielpublikum
      t.string :zulassung
      t.string :abschluss
      t.string :info
      t.string :leitung
      t.string :kontakt
      t.string :image

      t.timestamps
    end
  end
end
