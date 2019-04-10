class CreateJobSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :job_skills do |t|
      t.references :skill
      t.references :job
      t.timestamps
    end
  end
end
