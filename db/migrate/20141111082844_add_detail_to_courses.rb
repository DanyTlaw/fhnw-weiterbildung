class AddDetailToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :detail, :string
  end
end
