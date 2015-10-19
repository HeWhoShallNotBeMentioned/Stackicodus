class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.boolean :admin, default: false
      t.string :avatar, default: "http://image.shutterstock.com/display_pic_with_logo/882263/172285076/stock-photo-avatar-mafia-skull-gangster-172285076.jpg"
      t.integer :reputation_points
    end
  end
end
