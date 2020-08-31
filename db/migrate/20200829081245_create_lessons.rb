class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :professor_id
      t.string :title #과목
      t.string :separate_class #분반
      t.string :separate_major #이수구분
      t.string :separate_subject #과목구분
      t.string :separate_subject_register #교과적용부분
      t.string :campus #캠퍼스
      t.string :grade_score #학점
      t.string :grade_theory_score #이론
      t.string :grade_exam_score #실습
      t.string :timetable #시간표
      t.string :class_target #수강대상 .으로 구
      t.float :score
      t.timestamps
    end
  end
end
