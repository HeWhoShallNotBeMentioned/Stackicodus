class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
    add_column(:answers, :created_at, :datetime)
    add_column(:answers, :updated_at, :datetime)
  end
end
