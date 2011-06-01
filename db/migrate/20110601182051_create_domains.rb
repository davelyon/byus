class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.integer :links_count, default: 0
      t.string :root
      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
