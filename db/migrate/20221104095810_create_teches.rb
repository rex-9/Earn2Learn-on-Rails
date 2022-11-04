class CreateTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :teches do |t|
      t.string :name

      t.timestamps
    end
  end
end
