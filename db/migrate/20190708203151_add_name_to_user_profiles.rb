class AddNameToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :name, :string
  end
end
