require "rails/generators"
require "rails/generators/migration"

module TasksMigration
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)

      desc "Add setting files and create tasks folder"
      def copy_config
        copy_file "tasks_migration.yml", "config/tasks_migration.yml"
      end

      desc "Add migration for Tasks Migration"
      def copy_migrations
        migration_path = File.join "db", "migrate"
        migration_template "migration.rb", "#{migration_path}/create_tasks_migration_schema.rb",
          migration_version: migration_version
      end

      def self.next_migration_number path
        next_migration_number = current_migration_number(path) + 1

        ActiveRecord::Migration.next_migration_number next_migration_number
      end

      def rails5_and_up?
        Rails::VERSION::MAJOR >= 5
      end

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if rails5_and_up?
      end
    end
  end
end
