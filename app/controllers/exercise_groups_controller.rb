class ExerciseGroupsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @exercise_group = ExerciseGroup.find(params[:id])
  end

end
