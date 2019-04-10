class SkillsController < ApplicationController

  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.json {render :show, status: :created}
      else
        format.json {render json: @skill.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def skill_params
    params.require('skill').permit(:name)
  end
end
