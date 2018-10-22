class StudentsController < ApplicationController

  #create
    def new
      @student =Student.new  #create blank object for form_for helper to use
    end

    def create
      Student.create student_params
      redirect_to(students_path)
    end

  #read
    def index
      @students = Student.all
    end

    def show
      @student = Student.find params[:id]
    end

  #update
    def edit
      @student = Student.find params[:id]
    end

    def update
      @student = Student.find params[:id]
      @student.update student_params
      redirect_to student_path(@student.id)
    end

  #delete
    def destroy
      student = Student.find params[:id]
      student.destroy
      redirect_to students_path
    end


    private

    def student_params
      params.require(:student).permit(:name, :location, :hobbies, :image, :future_id)
    end


end
