#!/bin/bash

check_variables() {
  # Check if needed variables are defined
  if [ -z "$SHOOT_TIME" ] || [ -z "$SHOOT_NUMBER" ] || [ -z "$SHOOT_NAME" ];then
    print_error_msg
    exit 1
  fi
  # Now check if SHOOT_TIME and SHOOT_NUMBER are numbers
  if [ "$SHOOT_TIME" -eq "$SHOOT_TIME" ] && [ "$SHOOT_NUMBER" -eq "$SHOOT_NUMBER" ]; then
    echo "Good parameters =)"
  else
    print_error_msg
    exit 2
  fi
}

print_error_msg() {
  echo "Error: we need more parameters to shoot" > /dev/stderr
  echo "Usage:"
  echo "  SHOOT_TIME=<integer number of seconds> SHOOT_NUMBER=<integer number of shoots> SHOOT_NAME=<a prefix for file names> $0"
}

start_shooting() {
  for SHOOT_COUNT in `seq 1 $SHOOT_NUMBER`; do
    gphoto2     --filename "${SHOOT_NAME}_${SHOOT_COUNT}.CR2" \
      --wait-event=2s \
      --set-config eosremoterelease=5 \
      --wait-event=${SHOOT_TIME}s \
      --set-config eosremoterelease=11 \
      --wait-event-and-download=5s;
  done
}

set -e
check_variables
start_shooting
echo "Done =)"
