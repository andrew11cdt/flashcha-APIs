
set :stage, :staging
set :rails_env, :staging
set :deploy_to, "/home/jun/staging/apps/flashcha"
# set :branch, :config_deploy
server "68.183.182.232", user: "jun", roles: %w(web app db)