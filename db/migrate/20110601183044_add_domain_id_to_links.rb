class AddDomainIdToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :domain_id, :integer
  end

  def self.down
    remove_column :links, :domain_id
  end
end
