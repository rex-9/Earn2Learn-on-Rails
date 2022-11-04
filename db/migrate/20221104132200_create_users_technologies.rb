class CreateUsersTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :users_technologies do |t|
      t.references :user,             null: false, foreign_key: true, index: true
      t.references :technology,       null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
