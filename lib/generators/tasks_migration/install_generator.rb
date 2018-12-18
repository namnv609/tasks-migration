require "rails/generators"

module TasksMigration
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Add setting files and create tasks folder"
      def copy_config
        copy_file "tasks_migration.yml", "config/tasks_migration.yml"
      end

      def add_tasks_folder
        empty_directory "app/migration_tasks"
        create_file "app/migration_tasks/.keep"
      end
    end
  end
end
