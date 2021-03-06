module Venus
  module Generators
    class InitGenerator < Base
      desc "Setup essential gems"

      def name
        "initalize"
      end

      def asks
        @gems = {}
        @paginate = ask?('install paginate gem "kaminari"?', true) unless has_gem?('kaminari')
        @whenever = ask?('install scheduling gem "whenever"?', true) unless has_gem?('whenever')
        [:simple_form, :nested_form, :haml].each do |gemname|
          @gems[gemname] = ask?("install gem '#{gemname}'?", true)
        end
      end

      def remove_usless_file
        remove_file 'public/index.html'
        remove_file 'app/assets/images/rails.png'
      end

      def paginate
        if @paginate
          generate 'venus:paginate'
        end
      end

      def cron
        if @whenever
          generate 'venus:cron'
        end
      end
      
      def enable_email_delivery_error
        file = 'config/environments/development.rb'
        find = 'raise_delivery_errors = false'
        replace = 'raise_delivery_errors = true'
        replace_in_file(file, find, replace) if file_has_content?(file, find)
      end

      def gems
        @is_append = !file_has_content?('Gemfile','group :development do')
        if @is_append
          concat_template('Gemfile', 'gem_developments.erb')
        else
          insert_template('Gemfile', 'gem_developments.erb', :after => 'group :development do')
        end
        @gems.each do |gemname, ans|
          add_gem(gemname.to_s) if ans
        end
        bundle_install
      end

      def run_magic_encoding
        run 'magic_encoding'
      end

    end
  end
end
