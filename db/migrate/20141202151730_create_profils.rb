class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.integer :user_id
      t.string :schulname
      t.string :standort
      t.string :fachbereich
      t.string :info
      t.string :link
      t.integer :kurse

      t.timestamps
    end
  end
end
