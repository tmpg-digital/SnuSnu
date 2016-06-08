
require 'rails/generators/base'
require 'rails/generators/migration'


module Snusnu
  class Base < Rails::Generators::Base
    include Rails::Generators::Migration

    def self.source_root
      @_snusnu_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'snusnu', generator_name, 'templates'))
    end

    def self.banner
      "[about being sentenced to death by 'Snu-Snu'] I never thought I would die this way, but I've always really hoped"
    end


    def print_usage
      self.class.help(Thor::Base.shell.new)
      exit
    end

    private

    def add_gem(name, options = {})
      gemfile_content = File.read(destination_path("Gemfile"))
      File.open(destination_path("Gemfile"), 'a') { |f| f.write("\n") } unless gemfile_content =~ /\n\Z/
      gem name, options unless gemfile_content.include? name
    end

    def replace_gemfile
      template 'Gemfile.erb', 'Gemfile', force: true do |content|
      end
    end

    def configure_simple_form
      bundle_command "exec rails generate simple_form:install"
    end


  end
end
