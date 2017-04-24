class ChangeNullContstraints < ActiveRecord::Migration[5.0]
  def change
    change_column :post_subs, :sub_id, :integer, :null => true
    change_column :post_subs, :post_id, :integer, :null => true
  end
end
