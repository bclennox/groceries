lock '3.6.1'

set :application, 'groceries'
set :repo_url, 'github-bclennox:bclennox/groceries.git'

set :linked_files, fetch(:linked_files, []).push('server/db/config.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('server/log', 'server/tmp/cache')

set :rbenv_ruby, File.read('.ruby-version').strip
set :bundle_gemfile, -> { release_path.join('server/Gemfile') }

after 'deploy:updated', 'deploy:migrate'
after 'deploy:updated', 'deploy:upload'
