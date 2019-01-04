require "active_record"
require "models/tasks_migration_schema"

module TasksMigration
  module Migrate
    class << self
      def start
        all_tasks = get_all_tasks
        executed_tasks = TasksMigrationSchema.pluck :version

        (all_tasks - executed_tasks).each do |task|
          puts "Running task #{task}..."
          task.constantize.execute
          TasksMigrationSchema.create version: task
        end
      end

      private
      def get_all_tasks
        tasks_file_path = Rails.root.join "config", "tasks_migration.yml"
        YAML.load_file(tasks_file_path)["tasks"] || []
      end
    end
  end
end
