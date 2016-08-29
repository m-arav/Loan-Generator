require 'background_job'
class LoansController < ApplicationController

  before_action :setup_loan, only:[:show, :timer]

  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def show
    @schedule = @loan.generate_schedule
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      redirect_to loan_timer_path(@loan)
    else
      render 'new'
    end
  end

  def timer
    background_job = BackgroundJob.new
    session[:background_job_id] = background_job.object_id
    start_timer(@loan)
  end

  def progress
    data = Hash.new
    job_object = ObjectSpace._id2ref(session[:background_job_id])
    data[:message] = "#{job_object.progress}% #{job_object.message}"
    data[:percent] = job_object.progress
    render :plain => data.to_json
  end

  private

  def start_timer(loan)
    @loan = loan
    background_job = ObjectSpace._id2ref(session[:background_job_id])
    Thread.new { background_job.run }
  end

  def setup_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit!
  end
end
