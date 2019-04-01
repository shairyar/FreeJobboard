module Employers
  class JobsController < EmployersController
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :set_company, only: [:index, :create]

    # GET /jobs
    # GET /jobs.json
    def index
      @jobs = Job.where(company_id: @company.id)
    end

    # GET /jobs/1
    # GET /jobs/1.json
    def show
    end

    # GET /jobs/new
    def new
      @job = Job.new
    end

    # GET /jobs/1/edit
    def edit
    end

    # POST /jobs
    # POST /jobs.json
    def create
      company = Company.find(params[:company_id])
      @job = company.jobs.create(job_params)

      respond_to do |format|
        if @job.save
          format.html { redirect_to employers_job_path(@job.id), notice: 'Job was successfully created.' }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /jobs/1
    # PATCH/PUT /jobs/1.json
    def update
      respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to employers_job_path(@job), notice: 'Job was successfully updated.' }
          format.json { render :show, status: :ok, location: @job }
        else
          format.html { render :edit }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /jobs/1
    # DELETE /jobs/1.json
    def destroy
      @job.destroy
      respond_to do |format|
        format.html { redirect_to employers_company_jobs_path(@job.company), notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
      authorize @job
    end

    def set_company
      @company = Company.find(params[:company_id])
      authorize @company
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description)
    end
  end
end
