class ComplaintsController < ApplicationController
before_action :is_authenticated, except: [:index]
  def index
    @complaints = Complaint.all
  end

  def new
    @complaint = Complaint.new
  end


end
