# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120628222913) do

  create_table "declaration_categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "declaration_categories", ["parent_category_id"], :name => "fk_declaration_categories_parent_category_id"

  create_table "declaration_statements", :force => true do |t|
    t.string   "body"
    t.integer  "declaration_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "declaration_statements", ["declaration_category_id"], :name => "fk_declaration_statements_declaration_category_id"

  create_table "institutions", :force => true do |t|
    t.string  "nosaukums",               :limit => 128, :null => false
    t.string  "juridiskais_ststuss",     :limit => 45,  :null => false
    t.string  "padotibas_forma",         :limit => 45,  :null => false
    t.integer "padotibas_ministrija"
    t.string  "adrese",                  :limit => 256
    t.string  "telefons",                :limit => 16
    t.string  "majas_lapa",              :limit => 256
    t.string  "e_pasts",                 :limit => 256
    t.string  "darba_laiks",             :limit => 256
    t.string  "pienemsanas_laiki",       :limit => 256
    t.text    "noteikumi"
    t.text    "reglaments"
    t.text    "struktura"
    t.text    "normativo_aktu_saraksts"
    t.text    "publisks_parskats"
    t.string  "mk_rikojums",             :limit => 256
    t.string  "mk_padotibas_loceklis",   :limit => 256
    t.text    "strategija"
    t.text    "merki_rezultati"
    t.string  "budzets",                 :limit => 256
    t.text    "papildus_skaidrojums"
    t.text    "amatpersonas"
  end

  add_index "institutions", ["padotibas_ministrija"], :name => "fk_institutions_padotibas_ministrija"
  add_index "institutions", ["padotibas_ministrija"], :name => "padotibas_ministrija"

  create_table "links", :force => true do |t|
    t.string   "node1_type"
    t.string   "node2_type"
    t.integer  "node1_id"
    t.integer  "node2_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["node1_type", "node1_id"], :name => "link_1st_node_idx"
  add_index "links", ["node2_type", "node2_id"], :name => "link_2nd_node_idx"

  create_table "vrp_categories", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "vrp_subtask_institutions", :id => false, :force => true do |t|
    t.integer "subtask_id",     :null => false
    t.integer "institution_id", :null => false
  end

  add_index "vrp_subtask_institutions", ["institution_id"], :name => "institution"
  add_index "vrp_subtask_institutions", ["subtask_id"], :name => "subtask"

  create_table "vrp_subtasks", :force => true do |t|
    t.text    "description",               :null => false
    t.string  "ministries",                :null => false
    t.string  "end_date",                  :null => false
    t.text    "link",                      :null => false
    t.integer "vrp_task_id",               :null => false
    t.string  "subtask_num", :limit => 32, :null => false
    t.text    "result"
  end

  create_table "vrp_tasks", :force => true do |t|
    t.string  "task_type",       :null => false
    t.integer "vrp_category_id"
    t.text    "task",            :null => false
  end

  add_index "vrp_tasks", ["vrp_category_id"], :name => "fk_vrp_tasks_vrp_category_id"

end
