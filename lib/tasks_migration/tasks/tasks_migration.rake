require "rake"

namespace :tasks_migration do
  desc "Migrate the tasks"
  task migrate: :environment do
    TasksMigration::Migrate.start
  end
end
