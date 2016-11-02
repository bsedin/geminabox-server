require 'dotenv'
require 'rubygems'
require 'geminabox'

Dotenv.load

Geminabox.data = ENV['GEMINABOX_DATA']
Geminabox.data = ENV['GEMINABOX_RUBY_GEMS_URL']
run Geminabox::Server
