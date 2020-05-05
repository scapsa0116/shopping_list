class ChaneColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :passwordd_digest, :password_digest
  end
end
