namespace :tasks_migration do
  require "tasks-migration"

  desc "Migrate the tasks"
  task :migrate do
    on roles(:db) do |host|
      info "Migrate tasks..."
      TasksMigration::Migrate.start
    end
  end
end
