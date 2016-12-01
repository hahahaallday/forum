class Api::BaseController < ApplicationController
	before_action :enable_cors
	before_action :set_default_format
 	skip_before_action :verify_authenticity_token
 	before_action :authorize_header_token

	
	private

	def authorize_header_token
    if request.headers['ABC'] != '123456'
      # respond_error('Token authorize fail', 403)
    end
  end

	def enable_cors
		headers['Access-Control-Allow-Origin'] = '*'
  	headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
  	headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
  end	

  def set_default_format
    request.format = 'json'
  end
end
