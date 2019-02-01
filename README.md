# Tasks Migration

## Getting started
Tasks Migration works with Rails 4.1 onwards. Add the following line to your Gemfile

```ruby
gem "tasks-migration"
```

Then run

```
bundle install
```

Next, you need to run the generator:

```
rails generate tasks_migration:install
```

This command will create 2 files:

* `db/migrate/<timestamp>_create_tasks_migration_schema.rb` (Create new table tasks_migration_schema in database)
* `config/tasks_migration.yml` (Define Tasks will be runs )

## Usage

### Basic

Create a new task by command:

```
rails generate tasks_migration:task <TaskName>
```

Business Logic will be handled in method `self.excute` on file  `app/migration_tasks/<task_name>.rb`. Example:

```ruby
# app/migration_tasks/hello_world_task.rb
class HelloWorldTask
  def self.execute
      puts "Hello world :D"
  end
end
```

And add this task into `config/tasks_migration.yml`. Example:

```yaml
# config/tasks_migration.yml
tasks:
  - HelloWorldTask
```

The last, you run command:

```
bundle exec rake tasks_migration:migrate
```

### Capistrano


Using Tasks Migration with Capistrano (after deploying completed `deploy:finished`) we just need to add following line into `Capfile`:

```
require "capistrano3/tasks-migration"
```

Another way, you also can do it manually through `Capistrano Task`:

```
bundle exec cap <stage> tasks_migration:migrate
```

# Credits

Special thanks to [**ThanhTT**](https://github.com/thanhtt) for this file (**README.md**)
