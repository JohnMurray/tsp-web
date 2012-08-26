require 'bundler/setup'
Bundler.require(:production)
require './app'


run Sinatra::Application
