require "rails/generators"

module TasksMigration
  module Generators
    class TaskGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      class_option "no-suffix", type: :boolean, default: false,
        desc: "Remove Task suffix for task class name"

      desc "Add new migration task"
      def add_task
        task_file_suffix = "_task" unless options["no-suffix"]
        task_file_name = "#{name.underscore}#{task_file_suffix}.rb"

        template "task.rb", "app/migration_tasks/#{task_file_name}"
      end
    end
  end
end
