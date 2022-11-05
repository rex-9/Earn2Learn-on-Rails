class CreateUsersTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :users_technologies do |t|
      t.belongs_to :user
      t.belongs_to :technology

      t.timestamps
    end
  end
end
