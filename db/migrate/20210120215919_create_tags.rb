class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.references :jot
      t.references :category

      t.timestamps
    end
  end
end
