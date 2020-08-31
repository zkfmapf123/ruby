require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe '수업항목은 올바른가?' do
    subject{
      described_calss.new(
        title: "ruby프로그래밍",
        separate_class: "1",
        separate_major: "전공필수",
        separate_subject: "전공필수",
        separate_subject_register: "전공필수",
        campus: "메트로폴",
        grade_score: "3",
        grade_theory_score: "2",
        grade_exam_score: "2",
        timetable: "수(1~2)",
        class_target: "4학년",
      )
    }

    it '모든 항목이 존재한다' do
      expect(subject).to be_valie
    end
  end
end
