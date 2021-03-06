require "app_parameters_setter/version"
if defined? Rails
  require "app_parameters_setter/rails_integration"
else
  require "app_parameters_setter/ruby_integration"
  require "app_parameters_setter/app_parameter"
  Object.const_set("AppParameter", AppParametersSetter::AppParameter)
  AppParameter.load
end

module AppParametersSetter
  # ensures the setup only gets run once
  @@_ran_once = false

  mattr_accessor :const_name
  @@const_name = "AppParameter"

  def self.setup
    yield self if @@_ran_once == false
    @@_ran_once = true
  end

  # Loads and sets the settings constant!
  def self.load_and_set_settings
  	require "app_parameters_setter/app_parameter"
  	AppParameter.load
  	Kernel.const_set(AppParametersSetter.const_name, AppParameter)
  end

  def self.reload!
    Kernel.const_get(AppParametersSetter.const_name).reload!
  end
end
