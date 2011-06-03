# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
$LOAD_PATH.unshift '/Users/dev/hashrocket/rack-cors/lib/'
require 'rack/cors'
use Rack::CORS , { request_methods: ['OPTIONS','POST'], allowed_headers: ['x-requested-with'], any_origin: true }
run Byus::Application
