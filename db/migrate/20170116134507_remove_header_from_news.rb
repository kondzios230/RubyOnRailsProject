class RemoveHeaderFromNews < ActiveRecord::Migration[5.0]
  def change
    remove_column :news, :header, :text
  end
end
