require 'spec_helper'

module ModelMacros
  def shouldnt_reek
    it 'shouldnt reek' do
      desc = self.class.description.to_s.underscore
      model_contents = File.read("#{Rails.root}/app/models/#{desc}.rb")
      expect(model_contents).not_to reek
    end
  end
end

module ControllerMacros
  def sign_me_in
    before :each do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @current_user = FactoryGirl.create(:user)
      sign_in :user, @current_user
    end
  end

  def shouldnt_reek
    it 'should not reek' do
      local_path = self.class.metadata[:file_path].gsub(%r{(^\.\/spec)(.*)(\_spec\.rb$)}, 'app\2.rb')
      full_path = "#{Rails.root}/#{local_path}"
      expect(File.exist?(full_path)).to eq(true), "Testing if #{full_path} reeks but file does not exist. consider restructuring your code/spec"
      expect(File.read(full_path)).not_to reek
    end
  end

end

ENV['RAILS_ENV'] ||= 'test'

require 'rubygems'
require 'simplecov'
SimpleCov.start :rails do
  minimum_coverage 95
end
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fail_fast = false
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.extend ModelMacros, type: :model
  config.include Rails.application.routes.url_helpers
  config.infer_spec_type_from_file_location!

  config.infer_base_class_for_anonymous_controllers = true

  # Database cleaning
  config.use_transactional_fixtures = false

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
