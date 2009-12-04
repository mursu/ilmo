class CourseInstancesController < ApplicationController
  def new
    @course_instance = CourseInstance.new
  end

  def create
    @course_instance = CourseInstance.new(params[:course])

    if @course_instance.save
      flash[:notice] = 'Course Instance was successfully created.'
      redirect_to(@course_instance)
    else
      render :action => "new"
    end
  end
  
  def index
    @course_instances = CourseInstance.all
  end

  def show
    @course_instance = CourseInstance.find(params[:id])
  end

end
