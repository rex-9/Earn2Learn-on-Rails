class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content,     null: false
      t.belongs_to  :user,   null: false, foreign_key: true, index: true
      t.string :username,    null: false
      t.belongs_to :study,   null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
