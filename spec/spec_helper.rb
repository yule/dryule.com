  module ActiveModel; module Observing; end; end # Prevents spork from exiting due to non-existent class in rails4.


  module ModelMacros
    def shouldnt_reek
      it "shouldnt reek" do
        model_contents = File.read("#{Rails.root}/app/models/#{self.class.description.to_s.underscore}.rb")
        model_contents.should_not reek
      end
    end
  end

  module ControllerMacros
    def sign_me_in
      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @current_user = FactoryGirl.create(:user)
        sign_in :user, @current_user
      end
    end

    def shouldnt_reek
      it "should not reek" do
        controller_contents = File.read("#{Rails.root}/app/controllers/#{controller.controller_path}_controller.rb")
        controller_contents.should_not reek
      end
    end


  end

  require 'rubygems'
  require 'spork'
  require 'simplecov'
  SimpleCov.start 'rails'

  Spork.prefork do

    ENV["RAILS_ENV"] ||= 'test'

    require File.expand_path("../../config/environment", __FILE__)
    require 'rspec/rails'
    require 'rspec/autorun'
    require "capybara/rspec"
    require 'reek/spec'

    Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

    RSpec.configure do |config|
      config.mock_with :rspec
      config.include FactoryGirl::Syntax::Methods
      config.use_transactional_fixtures = true
      config.include Devise::TestHelpers, :type => :controller
      config.include(Reek::Spec)
      config.extend ControllerMacros, :type => :controller
      config.extend ModelMacros, :type => :model
      config.include Rails.application.routes.url_helpers

      config.order = "random"
    end

    ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  end

  Spork.each_run do
    # This code will be run each time you run your specs.
  end

