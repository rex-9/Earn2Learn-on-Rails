class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username,             null: false, unique: true, index: true
      t.string :fullname,             null: false
      t.string :email,                null: false, unique: true
      t.string :password_digest
      t.string :goal,                 null: false
      t.string :image
      t.text :bio
      t.string :city,                 null: false
      t.date :birthdate,              null: false
      t.string :phone,                null: false, unique: true
      t.string :role,                 null: false, default: 'learner'
      t.string :github
      t.string :linkedin
      t.string :tech_count,           null: false, default: 0
      t.string :study_count,          null: false, default: 0
      t.string :certificate_count,    null: false, default: 0

      t.timestamps
    end
  end
end
