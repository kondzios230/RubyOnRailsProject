class CreateComents < ActiveRecord::Migration[5.0]
  def change
    create_table :coments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :news, foreign_key: true

      t.timestamps
    end
    add_index :coments, [:news_id, :created_at]
  end
end
