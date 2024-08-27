class AddImageUrlToGarments < ActiveRecord::Migration[7.1]
  def change
    add_column :garments, :image_url, :string
  end
end
