class AddParentCommentIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :parent_comment_id, :integer
  end
end
