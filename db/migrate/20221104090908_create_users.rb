class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username,             null: false, unique: true, index: true
      t.string :fullname,             null: false
      t.string :email,                null: false, unique: true
      t.string :password_digest
      t.string :catchphrase,          null: false
      t.string :goal,                 null: false
      t.integer :views,               default: 0
      t.string :image
      t.text :bio
      t.string :city,                 null: false
      t.date :birthdate,              null: false
      t.string :phone,                null: false, unique: true
      t.string :role,                 null: false, default: 'learner'
      t.string :github
      t.string :linkedin

      t.timestamps
    end
  end
end
