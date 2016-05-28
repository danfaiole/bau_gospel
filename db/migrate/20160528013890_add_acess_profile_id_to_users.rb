class AddAcessProfileIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :access_profiles, index: true, foreign_key: true
    end
  end
end
