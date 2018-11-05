class AddContentToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :content, :text
  end
end
