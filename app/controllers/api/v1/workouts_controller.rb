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
    
    private
    
      def workout_params
        params.require(:workout).permit(:title, :worktype, :datetime, :location, :description)
      end
  end
end