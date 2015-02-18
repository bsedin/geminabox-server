require 'dotenv'
require 'rubygems'
require 'geminabox'

Dotenv.load

Geminabox.data = ENV['GEMINABOX_DATA']
run Geminabox::Server
