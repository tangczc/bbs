class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :username
      t.string :email
      t.integer :issue_id

      t.timestamps
    end
  end
end
