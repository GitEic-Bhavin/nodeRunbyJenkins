#!/bin/bash
# timeout 5 npm start

npm start & pid=$! # $! will capture pid of npm process
sleep 5 # wait for 5 sec to complete / run nodejs app for 5 sec
kill $pid # kill the npm process.
