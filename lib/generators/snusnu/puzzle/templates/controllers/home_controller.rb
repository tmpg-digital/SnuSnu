create_file 'app/controllers/home_controller.rb' do
  class HomeController < ApplicationController
    def index
    end

    def game
    end

    def register


    end

    def thanks

    end

    def sweeps
      @new_user = User.new()
    end

    def submit
      @form_opened = true
      @new_user = User.new(user_params)

      if @new_user.save
        redirect_to action: :thanks

      else
        render action: :sweeps
      end
    end

    def support_email
      name = params[:name]
      email = params[:email]
      body = params[:comments]
      SupportMailer.support_email(name, email, body).deliver_now
      redirect_to action: :thanks , notice: 'Support Request Sent'
    end



    private

    def user_params
      params.require(:user).permit(:full_name, :email, :opt_in)
    end

  end

end
