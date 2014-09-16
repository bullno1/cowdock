#!/bin/sh
./shell.sh -eval "application:ensure_all_started(cowdock),application:ensure_all_started(sync)" $*
