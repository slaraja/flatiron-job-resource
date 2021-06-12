class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.datetime :grad_date
      t.string :linkedin_profile
      t.string :status

      t.timestamps
    end
  end
end
