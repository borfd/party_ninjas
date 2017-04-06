class AddHeaderImageToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :header_image, :string
  end
end
