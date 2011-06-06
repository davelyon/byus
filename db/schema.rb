# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110601183044) do

  create_table "bins", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret_hash"
    t.string   "public_hash"
    t.boolean  "allow_public", :default => true
  end

  add_index "bins", ["public_hash"], :name => "index_bins_on_public_hash"
  add_index "bins", ["secret_hash"], :name => "index_bins_on_secret_hash"

  create_table "domains", :force => true do |t|
    t.integer  "links_count", :default => 0
    t.string   "root"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "location"
    t.integer  "bin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "domain_id"
  end

end
