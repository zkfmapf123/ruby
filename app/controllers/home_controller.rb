class HomeController < ApplicationController
    attr_reader :bool, :professor, :lesson, :recent_lesson, :url, :urlText
    require 'openssl'
    require 'open-uri'
    require "tasks/register_db_lesson"
    require "tasks/register_db_professor"
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

    def initial
        @findCrawl = []
    end
    

    def index
        initial()
        @recent_lesson = LessonEval.limit(3).order(created_at: :desc)
        @lesson = Lesson.limit(5).order(score: :desc)
        @professor = Professor.limit(5).order(score: :desc) 
        crawl()

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

    def crawl
        #크롤링 
        doc = Nokogiri::HTML(open("https://kduniv.ac.kr/"))
        crawlData = doc.css('.brd-wrap.mcont02 .m-list a')

        root_url = "https://kduniv.ac.kr"
        @url = []

        crawlData.each.with_index do |item,i|
            @url[i] = "#{i+1}"+","+root_url + item["href"] +","+"[학사공지] " + item.text
        end
    end

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
