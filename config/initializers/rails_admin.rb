RailsAdmin.config do |config|

  ### Popular gems integration

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end
  config.model Post do

    edit do
      field :title do
        column_width 200
      end

      field :img, :paperclip

      field :description, :ck_editor
      field :post_categories do
        orderable true
      end

    end
  end
  config.model WorkPost do

    edit do
      field :title do
        column_width 200
      end

      field :img, :paperclip

      field :description, :ck_editor
      field :work_categories do
        orderable true
      end

    end
  end
  config.model Info do

    edit do
      field :title do
        column_width 200
      end

      field :img, :paperclip

      field :description, :ck_editor

    end
  end
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard # mandatory
    index # mandatory
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
end
