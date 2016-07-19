RailsAdmin.config do |config|
  include ApplicationHelper

  # FUNKY: Try to change '/products' back to root_path
  config.authorize_with do
    redirect_to '/products' unless current_user.try(:admin?)
  end

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
  end
end
