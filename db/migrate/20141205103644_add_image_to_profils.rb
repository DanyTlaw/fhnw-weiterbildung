class AddImageToProfils < ActiveRecord::Migration
  def change
    add_column :profils, :image, :string
  end
end
