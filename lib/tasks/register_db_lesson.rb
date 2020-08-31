def set_lesson_save(args)
    @p = Professor.find_by_name(args[:p_name])

    @lesson = Lesson.new(
        professor: @p,
        title: args[:title],
        separate_class: args[:separate_class],
        separate_major: args[:separate_major],
        separate_subject: args[:separate_subject],
        separate_subject_register: args[:separate_subject_register],
        campus: args[:campus],
        grade_score: args[:grade_score],
        grade_theory_score: args[:grade_theory_score],
        grade_exam_score: args[:grade_exam_score],
        timetable: args[:timetable],
        class_target: args[:class_target])

    @lesson.save
    #valid
end