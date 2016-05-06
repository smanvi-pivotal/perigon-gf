#!/usr/bin/env bash
gfsh run --file=startServer.gfsh

#Gemfire query
#select created_at, retweet_count, text, id, user.name, user.location from /twitterRegion