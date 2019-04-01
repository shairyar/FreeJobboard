Rails.application.configure do
  if defined? Bullet
    config.after_initialize do
      Bullet.enable = true        # enable Bullet gem, otherwise do nothing
      Bullet.alert = true         # pop up a JavaScript alert in the browser
      Bullet.bullet_logger = true # log to the Bullet log file (Rails.root/log/bullet.log)
      Bullet.console = true       # log warnings to your browser's console.log (Safari/Webkit browsers or Firefox w/Firebug installed)
      Bullet.rails_logger = true  # add warnings directly to the Rails log
    end
  end
end