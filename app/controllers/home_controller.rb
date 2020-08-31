class HomeController < ApplicationController
    attr_reader :bool, :professor, :lesson, :recent_lesson
    require "tasks/register_db_lesson"
    require "tasks/register_db_professor"

    def index
        @recent_lesson = LessonEval.limit(4).order(:created_at)
        @lesson = Lesson.limit(1).order(:score)
        @professor = Professor.limit(1).order(:score)

        respond_to do |format|
            format.html{
                render "index"
            }

            format.json{
                render json:{
                    :status => 200
                }
            }
        end
    end

    def db
        @bool = true #true 디비설정 ok , false: not
        _eval_professor_file(@bool) #교수디비넣기
        _eval_lesson_file(@bool) #수업디비넣기

        redirect_to :controller => "home", action: "index"
    end

    private
    #csv_file
    def _eval_professor_file(bool)
        if @bool
            File.open("./public/lesson.csv") do |file|
                for line in file.readlines()
                    arr = line.split(",")

                    set_professor_save(
                        :p_name => arr[7],
                        :p_major => arr[6])
                end
            end    
        end    
    end

    def _eval_lesson_file(bool)
        if @bool
            File.open("./public/lesson.csv") do |file|
                for line in file.readlines()
                    arr = line.split(",")

                    set_lesson_save(
                        :title => arr[0],
                        :separate_class => arr[1],
                        :separate_major => arr[2],
                        :separate_subject => arr[3],
                        :separate_subejct_register => arr[4],
                        :campus => arr[5],
                        :p_name => arr[7],
                        :grade_score => arr[8],
                        :grade_theory_score => arr[9],
                        :grade_exam_score => arr[10],
                        :timetable => arr[11],
                        :class_target => arr[12])
                end
            end
        end
    end

end
