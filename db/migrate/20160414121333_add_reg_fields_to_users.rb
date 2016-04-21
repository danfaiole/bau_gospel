class AddRegFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :confirmation_token
      t.string :auth_token
      t.string :login, limit: 255
    end
  end
end
