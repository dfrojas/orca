module Api
    module V1
      class JobsController < ApplicationController
        def index
          render json: { status: "ok"}
        end
      end
    end
  end
