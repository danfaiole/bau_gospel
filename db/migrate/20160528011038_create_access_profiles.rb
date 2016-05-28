class CreateAccessProfiles < ActiveRecord::Migration
  def change
    create_table :access_profiles do |t|
      t.string :name
      t.string :short
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
