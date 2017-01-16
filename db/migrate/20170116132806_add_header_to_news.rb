class AddHeaderToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :header, :text
  end
end
