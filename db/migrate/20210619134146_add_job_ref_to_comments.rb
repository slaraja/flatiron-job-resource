class AddJobRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :job, null: false, foreign_key: true
  end
end
