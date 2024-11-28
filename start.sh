#!/bin/bash

LOGFILE="frontoffice.$(date +'%Y-%m-%d').log"
elixir -S mix phx.server >> /home/syed/omer/frontoffice/logs/$LOGFILE 2>&1