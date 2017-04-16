class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sent_by_id
      t.string :room

      t.timestamps
    end
  end
end
