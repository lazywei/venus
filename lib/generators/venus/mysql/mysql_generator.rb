module Venus
  module Generators
    class MysqlGenerator < Base
      desc "Setup MySql database connection"

      def asks
        @user = ask?("database login user?", 'root')
        @pass = ask?("database login password?", '')
        @db = ask?("database name? (will append rails env as postfix)", app_name)
        @recreate = ask?("drop db before create?", true)
      end

      def name
        "MySql"
      end

      def gemfile
        add_gem('mysql2')
        bundle_install
      end

      def gitignore
        add_gitignore "config/database.yml"
      end

      def config_yml
        template 'database.yml.erb', 'config/database.yml', :force => true
        @pass = ''
        template 'database.yml.erb', 'config/database.yml.example', :force => true
      end

      def create
        bundle_exec('rake db:drop') if @recreate
        bundle_exec('rake db:create')
      end

    end
  end
end