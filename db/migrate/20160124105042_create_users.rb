class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :password_digest, :first_name, :last_name, :role
      t.integer :is_active
      t.timestamps
    end
  end
end
