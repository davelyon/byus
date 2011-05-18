class AddPublicHashToBin < ActiveRecord::Migration
  def self.up
    add_column :bins, :public_hash, :string
    add_index :bins, :public_hash
  end

  def self.down
    remove_column :bins, :public_hash
    remove_index :bins, :public_hash
  end
end
