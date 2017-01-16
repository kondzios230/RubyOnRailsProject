class AddTitleToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :title, :text
  end
end
