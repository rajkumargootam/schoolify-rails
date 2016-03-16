class StudentsController < ApplicationController
  before_action :fetch_section
  def index
    @students = @section.students
  end

  def new
    @student = @section.students.new
  end
  def create
    @student = @section.students.new(students_params)
    @save_success = @student.save
  end
  def show
    @student = @section.students.find(params[:id])
  end

private
def fetch_section
  @klass = Klass.find(params[:klass_id])
  @section = @klass.sections.find(params[:section_id])
end
def students_params
  params.require(:student).permit(:name, :fathers_name, :gender, :email, :dob, :phone, :address)

end
end
