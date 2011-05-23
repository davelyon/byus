class AddPublicToBins < ActiveRecord::Migration
  def self.up
    add_column :bins, :allow_public, :boolean, default: true
    Bin.update_all ["allow_public = ?", true]
  end

  def self.down
    remove_column :bins, :allow_public
  end
end
