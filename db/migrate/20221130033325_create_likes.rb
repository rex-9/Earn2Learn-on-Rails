class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user,   null: false, foreign_key: true, index: true
      t.belongs_to :study,  null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
