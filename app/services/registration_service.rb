class RegistrationService

  attr_reader :params

  def initialize(params)
    @params = params
    @user = params[:user]
    @company = params[:company]
    @type = params[:employer] ? 'employer' : 'jobseeker'
  end

  def type
    @params[:employer] ? 'employer' : 'jobseeker'
  end

  def create
    user = User.new(@params[:user])
    user.save!
  end
end
