namespace :tasks_migration do
  desc "Migrate the tasks"
  task :migrate do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "tasks_migration:migrate"
        end
      end
    end
  end
end

after "deploy:finished", "tasks_migration:migrate"
