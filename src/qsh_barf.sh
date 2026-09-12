#
# This file is licensed under the MIT No Attribution license.
#
# shellcheck shell=sh
#

qsh_barf() {

  case $# in (0)
    set "Unknown error"
  esac

  qsh_barf_message="$0: Error:"
  for qsh_barf_text; do
    qsh_barf_message="$qsh_barf_message $qsh_barf_text"
  done
  qsh_barf_message=$qsh_barf_message.

  printf '%s\n' "$qsh_barf_message" >&2

  exit "${qsh_exit_status-1}"

}
