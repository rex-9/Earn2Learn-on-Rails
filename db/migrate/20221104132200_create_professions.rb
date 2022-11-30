class CreateProfessions < ActiveRecord::Migration[7.0]
  def change
    create_table :professions do |t|
      t.belongs_to :user,        null: false, foreign_key: true, index: true
      t.belongs_to :technology,  null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
