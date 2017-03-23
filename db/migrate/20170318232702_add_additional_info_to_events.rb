class AddAdditionalInfoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :additional_info, :text
  end
end
