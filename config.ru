require 'active_record'
require 'active_model_serializers'
Dir.glob(File.expand_path('../app/**/base_*.rb', __FILE__)).each { |file| require(file) }
Dir.glob(File.expand_path('../app/**/*.rb', __FILE__)).each { |file| require(file) }
Dir.glob(File.expand_path('../app/*.rb', __FILE__)).each { |file| require(file) }
require_relative 'rack_app'

run RackApp.new