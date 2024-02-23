class ApplicationController < ActionController::API
  include AuthenticationService
  include Secured
end
