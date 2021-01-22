class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.integer :priority, unique: true

      t.timestamps
    end
  end
end
