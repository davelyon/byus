class AddIndexToBinsSecretHash < ActiveRecord::Migration
  def self.up
    add_index :bins, :secret_hash
  end

  def self.down
    remove_index :bins, :secret_hash
  end
end
