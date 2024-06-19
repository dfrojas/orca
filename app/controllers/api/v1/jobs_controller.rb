module Api
  module V1
    class JobsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        job_data = params[:data]
        JobHandler.new.run(job_data)
        render json: { status: "ok"}
      end
      def create
        job_class_name = params[:job_class]
        job_class = job_class_name.constantize

        if job_class < JobHandler
          job_class.new.run({})
          render json: { status: 'Job enqueued' }, status: :ok
        else
          render json: { error: 'Invalid job class' }, status: :unprocessable_entity
        end

      end
    end
  end
end
