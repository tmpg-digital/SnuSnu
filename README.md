# SnuSnu
### TMPG SWEEPS GENERATOR

App creation.

- [] Adds models
  - [] `rails g model Client name client_type code`
  - [] `rails g model Campaign code name client_type start:date end:date, client:references`
  - [] `rails g model Site domain droplet ip_address title layout campaign:references`
  - [] `rails g model Entry first_name last_name email opt_in street city state zip phone custom1 custom2 custom3 custom4 custom5 custom6 custom7 custom8 custom9 custom10 campaign:references`

- [] Generate Mailer 'SupportMailer'
- [] Generate [unicorn.rb](unicorn.rb) file
- [] Generate [client_data.rb](client_data.rb) file
- [] Create Route File
  - ```
    get 'index', to: 'home#index'
    get 'sweeps', to: 'home#sweeps'
    get 'rules', to: 'home#rules'
    post 'submit', to: 'home#submit'
    get 'thankyou', to: 'home#thanks'

    root to: 'home#index
    route "post 'support_email', to: 'home#support_email'"
    ```
- [] `rails g paperclip Entry custom2`    
- [] Run Migrations 
