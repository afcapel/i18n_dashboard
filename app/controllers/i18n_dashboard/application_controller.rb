module I18nDashboard
  class ApplicationController < ::ApplicationController

    layout I18nDashboard.configuration.layout if I18nDashboard.configuration.layout

    # Sets a class method to specify a before-filter calling
    # whatever I18nDashboard.configuration.authentication_method is set to
    # Accepts the usual before_filter optionss
    def self.i18n_dashboard_authenticate(options ={})
      if i18n_dashboard_conf.authentication_method
        before_filter i18n_dashboard_conf.authentication_method, options
      end
    end

    # A helper method to access the I18nDashboard::configuration
    # at the class level
    def self.i18n_dashboard_conf
      I18nDashboard::configuration
    end


  end
end
