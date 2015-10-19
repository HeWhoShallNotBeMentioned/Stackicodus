class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.boolean :best, default: false

      t.integer :user_id
      t.integer :question_id
    end
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)
    change_column_default :questions, :complete, false
  end
end
