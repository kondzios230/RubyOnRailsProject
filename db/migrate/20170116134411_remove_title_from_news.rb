class RemoveTitleFromNews < ActiveRecord::Migration[5.0]
  def change
    remove_column :news, :title, :text
  end
end
