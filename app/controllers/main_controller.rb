class MainController < ApplicationController

    # GET /doctors
    def index
      @current_patient = current_patient
    end
end
