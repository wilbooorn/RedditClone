class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :sub_id
    add_column :posts, :sub_ids, :integer
  end
end
