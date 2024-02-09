# frozen_string_literal: true

require 'application_responder'

# frozen_string_literal: true

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html
end
