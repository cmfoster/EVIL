# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
EVEL::Application.initialize!

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    Rails.cache.reset if forked
    
    ObjectSpace.each_object(ActionDispatch::Session::DalliStore) { |obj| obj.reset }
  end
end