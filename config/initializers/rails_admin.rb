RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    redirect_to main_app.root_path, alert: 'Nie masz dostępu do tej strony' unless current_user.admin

    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model 'Attraction' do
    edit do
      field :name do
        label "Nazwa atrakcji"
      end
      field :x do
        label "X"
      end
      field :y do
        label "y"
      end
      field :mapa do
        render do
          bindings[:view].render :partial => 'my_partial', :locals => {:field => self, :form => bindings[:my_field]}
        end
      end
      field :price do
        label "Cena"
      end
      field :description do
        label "Opis"
      end
      field :sightseeing_time do
        label "Czas zwiedzania"
      end
      field :categories do
        label "Kategorie"
        associated_collection_cache_all true
        associated_collection_scope do
          Proc.new do |scope|
            scope = scope.order(:name)
          end
        end
      end
    end
  end
end
