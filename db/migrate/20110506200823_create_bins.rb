class CreateBins < ActiveRecord::Migration
  def self.up
    create_table :bins do |t|
      t.string :theme

      t.timestamps
    end
  end

  def self.down
    drop_table :bins
  end
end
