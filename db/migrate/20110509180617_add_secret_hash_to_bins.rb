class AddSecretHashToBins < ActiveRecord::Migration
  def self.up
    add_column :bins, :secret_hash, :string
  end

  def self.down
    remove_column :bins, :secret_hash
  end
end
