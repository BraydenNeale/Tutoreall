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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160307100725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state"
    t.string   "city"
    t.string   "region"
  end

  create_table "areas_tutors", id: false, force: :cascade do |t|
    t.integer "area_id",  null: false
    t.integer "tutor_id", null: false
  end

  add_index "areas_tutors", ["area_id", "tutor_id"], name: "index_areas_tutors_on_area_id_and_tutor_id", using: :btree
  add_index "areas_tutors", ["tutor_id", "area_id"], name: "index_areas_tutors_on_tutor_id_and_area_id", using: :btree

  create_table "associations", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "organisation_id"
    t.boolean  "confirmed",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "number"
    t.string   "bsb"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "provider_id"
    t.string   "provider_type"
  end

  add_index "bank_accounts", ["provider_type", "provider_id"], name: "index_bank_accounts_on_provider_type_and_provider_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "tutor_id"
    t.integer  "student_id"
    t.datetime "date"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "subject"
    t.text     "description"
    t.integer  "duration"
    t.boolean  "tutor_change"
    t.string   "location"
    t.string   "workflow_state"
    t.decimal  "cost",           precision: 6, scale: 2
  end

  add_index "lessons", ["student_id"], name: "index_lessons_on_student_id", using: :btree
  add_index "lessons", ["tutor_id"], name: "index_lessons_on_tutor_id", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.decimal  "fee"
    t.string   "logo"
    t.string   "banner"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "website"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "bank_account_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.boolean  "processed",                               default: false, null: false
    t.decimal  "value",           precision: 6, scale: 2
  end

  add_index "payments", ["bank_account_id"], name: "index_payments_on_bank_account_id", using: :btree
  add_index "payments", ["lesson_id"], name: "index_payments_on_lesson_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "area"
    t.string   "subjects",     default: "--- []\n"
    t.string   "availability", default: "--- []\n"
    t.integer  "age"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "sex"
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "braintree_customer_id"
  end

  add_index "students", ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true, using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "faculty"
    t.string   "group"
  end

  create_table "subjects_tutors", id: false, force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "tutor_id",   null: false
  end

  add_index "subjects_tutors", ["subject_id", "tutor_id"], name: "index_subjects_tutors_on_subject_id_and_tutor_id", using: :btree
  add_index "subjects_tutors", ["tutor_id", "subject_id"], name: "index_subjects_tutors_on_tutor_id_and_subject_id", using: :btree

  create_table "tutors", force: :cascade do |t|
    t.string   "email",                                          default: "",         null: false
    t.string   "encrypted_password",                             default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.string   "picture"
    t.decimal  "rate",                   precision: 6, scale: 2
    t.text     "about"
    t.text     "experience"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "date_of_birth"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "verified",                                       default: false
    t.string   "suburb"
    t.integer  "sex"
    t.string   "availability",                                   default: "--- []\n"
  end

  add_index "tutors", ["confirmation_token"], name: "index_tutors_on_confirmation_token", unique: true, using: :btree
  add_index "tutors", ["email"], name: "index_tutors_on_email", unique: true, using: :btree
  add_index "tutors", ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true, using: :btree

  create_table "tutors_weekdays", id: false, force: :cascade do |t|
    t.integer "tutor_id",   null: false
    t.integer "weekday_id", null: false
  end

  add_index "tutors_weekdays", ["tutor_id", "weekday_id"], name: "index_tutors_weekdays_on_tutor_id_and_weekday_id", using: :btree
  add_index "tutors_weekdays", ["weekday_id", "tutor_id"], name: "index_tutors_weekdays_on_weekday_id_and_tutor_id", using: :btree

  create_table "wwc_cards", force: :cascade do |t|
    t.integer  "tutor_id"
    t.string   "number"
    t.date     "expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lessons", "students"
  add_foreign_key "lessons", "tutors"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "payments", "bank_accounts"
  add_foreign_key "payments", "lessons"
end
