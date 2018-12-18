require "rails/generators"

module TasksMigration
  module Generators
    class TaskGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      desc "Add new migration task"
      def add_task
        template "task.rb", "app/migration_tasks/#{name.underscore}_task.rb", name: name
      end
    end
  end
end
