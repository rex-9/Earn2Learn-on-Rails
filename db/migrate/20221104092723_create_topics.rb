class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :name,         unique: true, null: false
      t.boolean :completed,   default: false
      t.integer :hours_taken,

      t.timestamps
    end
  end
end
