class StudentsController < ApplicationController

  def index 
    render json: Student.all
  end

  def show 
    render json: @student
  end

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  def update 
    @student.update!(student_params)
    reneder json: @student, status: :accepted
  end

  def destroy
    @student.destroy
    render json: {}, status: 202
  end

  private

  def find_student
    @student = Students.find(params[:id])
  end

  def student_params
    params.permit(:name, :major, :age)
  end
end
