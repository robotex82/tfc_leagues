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

ActiveRecord::Schema.define(:version => 20140504214754) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "players", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "players", ["email"], :name => "index_players_on_email", :unique => true

  create_table "tfc_leagues_clubs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "tfc_leagues_clubs", ["name"], :name => "index_tfc_leagues_clubs_on_name", :unique => true

  create_table "tfc_leagues_federations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "tfc_leagues_federations", ["name"], :name => "index_tfc_leagues_federations_on_name", :unique => true
  add_index "tfc_leagues_federations", ["slug"], :name => "index_tfc_leagues_federations_on_slug", :unique => true

  create_table "tfc_leagues_leagues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.integer  "federation_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "tfc_leagues_leagues", ["federation_id"], :name => "index_tfc_leagues_leagues_on_federation_id"
  add_index "tfc_leagues_leagues", ["name"], :name => "index_tfc_leagues_leagues_on_name"
  add_index "tfc_leagues_leagues", ["slug"], :name => "index_tfc_leagues_leagues_on_slug", :unique => true

  create_table "tfc_leagues_matchdays", :force => true do |t|
    t.integer  "sequential_number"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.integer  "season_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "tfc_leagues_matchdays", ["season_id"], :name => "index_tfc_leagues_matchdays_on_season_id"
  add_index "tfc_leagues_matchdays", ["slug"], :name => "index_tfc_leagues_matchdays_on_slug", :unique => true

  create_table "tfc_leagues_seasons", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.integer  "league_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "tfc_leagues_seasons", ["league_id"], :name => "index_tfc_leagues_seasons_on_league_id"
  add_index "tfc_leagues_seasons", ["slug"], :name => "index_tfc_leagues_seasons_on_slug", :unique => true

  create_table "tfc_leagues_team_memberships", :force => true do |t|
    t.integer  "team_id"
    t.integer  "membershipable_id"
    t.string   "membershipable_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "tfc_leagues_team_memberships", ["membershipable_type", "membershipable_id"], :name => "index_tfc_leagues_team_memberships_on_membershipable_type_and_id"
  add_index "tfc_leagues_team_memberships", ["team_id"], :name => "index_tfc_leagues_team_memberships_on_team_id"

  create_table "tfc_leagues_teams", :force => true do |t|
    t.integer  "sequential_number"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.integer  "club_id"
    t.integer  "season_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "tfc_leagues_teams", ["club_id"], :name => "index_tfc_leagues_teams_on_club_id"
  add_index "tfc_leagues_teams", ["season_id"], :name => "index_tfc_leagues_teams_on_season_id"

end
