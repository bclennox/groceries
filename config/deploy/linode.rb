server 'bclennox.com', user: 'deploy', roles: %w(app db web)

set :deploy_to, "$HOME/apps/#{fetch(:application)}"
set :default_env, path: '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH'
