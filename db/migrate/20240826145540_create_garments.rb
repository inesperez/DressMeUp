class CreateGarments < ActiveRecord::Migration[7.1]
  def change
    create_table :garments do |t|
      t.text :ai_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
