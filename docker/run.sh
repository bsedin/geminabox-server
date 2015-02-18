#!/bin/bash

rm -rf /geminabox.pid /geminabox.sock

export GEMINABOX_DATA=/data
export GEMINABOX_PID=/geminabox.pid
export GEMINABOX_HOST=0.0.0.0
export GEMINABOX_PORT=8080
export GEMINABOX_LOG=/geminabox.log

bundle exec foreman start
