require 'rubygems'
require 'geminabox'

GEMINABOX_OPTIONS = %i[
  data rubygems_proxy allow_remote_failure
].freeze

ENV['GEMINABOX_DATA'] ||= '/data'

GEMINABOX_OPTIONS.each do |option|
  Geminabox.public_send(:"#{option}=", ENV["GEMINABOX_#{option.upcase}"]) if ENV["GEMINABOX_#{option.upcase}"]
end

run Geminabox::Server
