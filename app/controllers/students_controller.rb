class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    name = params[:search_name]
    @students = Student.search(name)
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
