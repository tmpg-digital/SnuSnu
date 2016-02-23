require 'generators/snazzy'

module SnuSnu
  module Generators
    class PuzzleGenerator < Base
      include Rails::Generators::Migration

      def initialize(*args, &block)
        super
        generate "model", "User full_name:string email:string opt_in:boolean"

        rake "db:migrate"

        generate "mailer", "SupportMailer"

        route "root to: 'home#index'"
        route "post 'sweeps', to: 'home#submit'"
        route "post 'support_email', to: 'home#support_email'"

        create_puzzle

      end

      def create_puzzle
        ## TODO: Make this work!
        # add_gem "unicorn", :group => :production
        # add_gem "pg", :group => :production

        copy_file 'controllers/home_controller.rb', "app/controllers/home_controller.rb"

        ## Views
        inject_into_file 'app/views/layouts/application.html.erb', before: "<%= yield %>\n" do <<-'RUBY'
          <div id="main_container">
            <div id="social">
              <%= render 'home/partials/social' %>
            </div>
            <div id="left_pane">
          RUBY
        end

        inject_into_file 'app/views/layouts/application.html.erb', after: "<%= yield %>\n" do <<-'RUBY'
            </div>
            <div id="right_pane">
              <%= render 'home/partials/right_pane' %>
            </div>
            <div id="footer_menu" class="closed">
              <%= render 'home/partials/footer' %>
            </div>
          </div>
          RUBY
        end


        FileUtils.mkdir_p "app/views/home"
        FileUtils.mkdir_p "app/views/home/partials"
        FileUtils.mkdir_p "app/assets/stylesheets/includes"

        copy_file "views/index.html.erb", "app/views/home/index.html.erb"
        copy_file "views/game.html.erb", "app/views/home/game.html.erb"
        copy_file "views/sweeps.html.erb", "app/views/home/sweeps.html.erb"
        copy_file "views/thanks.html.erb", "app/views/home/thanks.html.erb"

        # views: partials
        copy_file "views/partials/_footer.html.erb", "app/views/home/partials/_footer.html.erb"
        copy_file "views/partials/_main_landing.html.erb", "app/views/home/partials/_main_landing.html.erb"
        copy_file "views/partials/_registration_form.html.erb", "app/views/home/partials/_registration_form.html.erb"
        copy_file "views/partials/_right_panel.html.erb", "app/views/home/partials/_right_panel.html.erb"
        copy_file "views/partials/_rules.html.erb", "app/views/home/partials/_rules.html.erb"
        copy_file "views/partials/_social.html.erb", "app/views/home/partials/_social.html.erb"
        copy_file "views/partials/_support.html.erb", "app/views/home/partials/_support.html.erb"
        copy_file "views/partials/_sweeps_landing.html.erb", "app/views/home/partials/_sweeps_landing.html.erb"

        ## Stylesheets
        remove_file 'app/assets/stylesheets/application.css'
        copy_file "stylesheets/application.scss", "app/assets/stylesheets/application.scss"
        copy_file "stylesheets/home.scss", "app/assets/stylesheets/home.scss"
        #stylesheets: includes
        copy_file "stylesheets/includes/branding.scss", "app/assets/stylesheets/includes/branding.scss"
        copy_file "stylesheets/includes/buttons.scss", "app/assets/stylesheets/includes/buttons.scss"
        copy_file "stylesheets/includes/forms.scss", "app/assets/stylesheets/includes/forms.scss"
        copy_file "stylesheets/includes/menus.scss", "app/assets/stylesheets/includes/menus.scss"

        ## Javascript
        remove_file 'app/assets/javascripts/application.js'
        copy_file "javascripts/application.js", "app/assets/javascripts/application.js"
      end


    end
  end
end
