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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191028221307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "edges", force: :cascade do |t|
    t.bigint "graph_id"
    t.bigint "initial_vertex_id"
    t.bigint "final_vertex_id"
    t.integer "time"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["final_vertex_id"], name: "index_edges_on_final_vertex_id"
    t.index ["graph_id"], name: "index_edges_on_graph_id"
    t.index ["initial_vertex_id"], name: "index_edges_on_initial_vertex_id"
  end

  create_table "graphs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vertices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ways", force: :cascade do |t|
    t.text "vertices_list"
    t.text "edges_list"
    t.integer "total_distance"
    t.integer "total_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "edges", "graphs"
  add_foreign_key "edges", "vertices", column: "final_vertex_id"
  add_foreign_key "edges", "vertices", column: "initial_vertex_id"
end
