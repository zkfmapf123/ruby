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

ActiveRecord::Schema.define(version: 2020_09_06_101227) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "homework_id"
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.integer "goodPoint", default: 0
    t.integer "badPoint", default: 0
    t.integer "view"
    t.string "image"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homework_user_flags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.boolean "point_flag", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeworks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.integer "view", default: 0
    t.string "image"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_evals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.text "comment"
    t.integer "goodPoint", default: 0
    t.integer "badPoint", default: 0
    t.integer "views", default: 0
    t.integer "score1", default: 0
    t.integer "score2", default: 0
    t.integer "score3", default: 0
    t.integer "score4", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_user_flags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.boolean "point_flag", default: true
    t.boolean "favorite_flag", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "professor_id"
    t.string "title"
    t.string "separate_class"
    t.string "separate_major"
    t.string "separate_subject"
    t.string "separate_subject_register"
    t.string "campus"
    t.string "grade_score"
    t.string "grade_theory_score"
    t.string "grade_exam_score"
    t.string "timetable"
    t.string "class_target"
    t.integer "goodPoint", default: 0
    t.integer "badPoint", default: 0
    t.integer "score", default: 0
    t.integer "view", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professor_evals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "professor_id"
    t.integer "user_id"
    t.text "comment"
    t.integer "goodPoint", default: 0
    t.integer "badPoint", default: 0
    t.integer "views", default: 0
    t.integer "score1", default: 0
    t.integer "score2", default: 0
    t.integer "score3", default: 0
    t.integer "score4", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professor_user_flags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "professor_id"
    t.integer "user_id"
    t.boolean "point_flag", default: true
    t.boolean "favorite_flag", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "major"
    t.string "image_url"
    t.integer "goodPoint", default: 0
    t.integer "badPoint", default: 0
    t.integer "score", default: 0
    t.integer "view", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "major"
    t.integer "alert"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
