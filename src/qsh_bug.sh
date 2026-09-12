#
# This file is licensed under the MIT No Attribution license.
#
# shellcheck shell=sh
#

qsh_bug() {

  case $# in (0)
    set "Unknown bug"
  esac

  qsh_bug_message="$0: Bug:"
  for qsh_bug_text; do
    qsh_bug_message="$qsh_bug_message $qsh_bug_text"
  done
  qsh_bug_message=$qsh_bug_message.

  printf '%s\n' "$qsh_bug_message" >&2

  exit "${qsh_exit_status-3}"

}
