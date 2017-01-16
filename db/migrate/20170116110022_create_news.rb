class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
     add_index :news, [:user_id, :created_at]
  end
end
