class ExamController < ApplicationController
  def filter_show
    @exam = Exam.all
  end

  def create_show
    
  end

  def create_exam
    exam_name = params[:exam_name]
    exam_code = params[:exam_code]
    exam_subject = params[:exam_subject]
    teacher = params[:teacher]
    exam = Exam.new
    exam.exam_name = exam_name
    exam.code = exam_code
    exam.subject = exam_subject
    exam.teacher = teacher
    if exam.save
      redirect_to '/exam/'+exam.id.to_s+'/info_show'
    end
    
  end

  def info_show
    id = params[:id]
    @exam = Exam.find id
  end

  
end