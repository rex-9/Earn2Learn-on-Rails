class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :name,                 null: false, unique: true
      t.string :user_count,           null: false, default: 0
      t.string :study_count,          null: false, default: 0
      t.string :certificate_count,    null: false, default: 0

      t.timestamps
    end
  end
end
