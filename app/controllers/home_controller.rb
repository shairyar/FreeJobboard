class HomeController < ApplicationController
  def index
    @jobs = Job.all
  end

  def terms
  end

  def privacy
  end
end
