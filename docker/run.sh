#!/bin/bash

rm -rf /geminabox.pid /geminabox.sock

export GEMINABOX_PID=/geminabox.pid
export GEMINABOX_DATA=${GEMINABOX_DATA:-/data}
export GEMINABOX_HOST=${GEMINABOX_HOST:-0.0.0.0}
export GEMINABOX_PORT=${GEMINABOX_PORT:-8080}
export GEMINABOX_LOG=${GEMINABOX_LOG:-/geminabox.log}
export GEMINABOX_RUBY_GEMS_URL=${GEMINABOX_RUBY_GEMS_URL:-https://rubygems.org/}

bundle exec foreman start
