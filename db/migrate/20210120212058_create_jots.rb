class CreateJots < ActiveRecord::Migration[6.0]
  def change
    create_table :jots do |t|
      t.string :title
      t.text :text
      t.integer :author_id, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
