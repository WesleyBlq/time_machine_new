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

ActiveRecord::Schema.define(version: 20180719005016) do

  create_table "bills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "wechat_users_id"
    t.float "price", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wechat_users_id"], name: "index_bills_on_wechat_users_id"
  end

  create_table "configs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "config_type"
    t.string "config_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_payers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "No"
    t.string "name"
    t.string "description"
  end

  create_table "wechat_configs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "environment", default: "development", null: false
    t.string "account", null: false
    t.boolean "enabled", default: true
    t.string "appid"
    t.string "secret"
    t.string "corpid"
    t.string "corpsecret"
    t.integer "agentid"
    t.boolean "encrypt_mode"
    t.string "encoding_aes_key"
    t.string "token", null: false
    t.string "access_token", null: false
    t.string "jsapi_ticket", null: false
    t.boolean "skip_verify_ssl", default: true
    t.integer "timeout", default: 20
    t.string "trusted_domain_fullname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["environment", "account"], name: "index_wechat_configs_on_environment_and_account", unique: true, length: { environment: 20, account: 100 }
  end

  create_table "wechat_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "openid", null: false
    t.string "hash_store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["openid"], name: "index_wechat_sessions_on_openid", unique: true
  end

  create_table "wechat_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "openid"
    t.string "nickname"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "headimgurl"
    t.integer "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
