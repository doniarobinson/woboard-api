module Api::V1
  class WorkoutsController < ApplicationController
    def index
      @workouts = Workout.order("created_at DESC")
      render json: @workouts
    end
    
    def create
      @workout = Workout.create(workout_params)
      render json: @workout
    end
    
    def update
      @workout = Workout.find(params[:id])
      @workout.update_attributes(workout_params)
      render json: @workout
    end
    
    def destroy
      @workout = Workout.find(params[:id])
      if @workout.destroy
        head :no_content, status: :ok
      else
        render json: @workout.errors, status: :unprocessable_entity
      end
    end
    
    private
    
      def workout_params
        params.require(:workout).permit(:title, :worktype, :datetime, :location, :description)
      end
  end
end