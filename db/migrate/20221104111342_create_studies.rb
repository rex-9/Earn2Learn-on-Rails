class CreateStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :studies do |t|
      t.string :topic,            null: false, index: true
      t.text :experience
      t.boolean :completed,       default: false
      t.integer :hours_taken,     default: 0, null: false

      t.belongs_to :user,         null: false, foreign_key: true, index: true
      t.belongs_to :technology,   null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
