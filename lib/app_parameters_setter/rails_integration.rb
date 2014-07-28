module AppParametersSetter
  module RailsIntegration
    class Railtie < Rails::Railtie

      # manually load the custom initializer before everything else
      initializer :load_custom_app_paramaters, :before => :load_environment_config, :group => :all do
        initializer = Rails.root.join("config", "initializers", "rails_config.rb")
        require initializer if File.exist?(initializer)
      end

      # Parse the settings before any of the initializers
      initializer :load_app_parameters_settings, :after => :load_custom_rails_config, :before => :load_environment_config, :group => :all do
        AppParametersSetter.load_and_set_settings
      end

      # Rails Dev environment should reload the Settings on every request
      if Rails.env.development?
        initializer :app_parameters_reload_on_development do
          ActionController::Base.class_eval do
            prepend_before_filter { ::AppParametersSetter.reload! }
          end
        end
      end
    end
  end
end