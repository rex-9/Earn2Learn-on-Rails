class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.string :title,                null: false, index: true
      t.string :link,                 null: false
      t.date :achieved_date
      t.date :expiration_date

      t.references :user,             null: false, foreign_key: true, index: true
      t.references :technology,       null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
