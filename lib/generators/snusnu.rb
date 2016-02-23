
require 'rails/generators/base'
require 'rails/generators/migration'


module SnuSnu
  class Base < Rails::Generators::Base
    include Rails::Generators::Migration

    def self.source_root
      @_snusnu_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'snazzy', generator_name, 'templates'))
    end

    def self.banner
      "rails generate snazzy:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
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

  end
end
