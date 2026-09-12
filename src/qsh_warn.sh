#
# This file is published under the CC0 Public Domain Dedication.
#

qsh_warn() {

  case $# in (0)
    set "Unknown warning"
  esac

  qsh_warn_message="$0: Warning:"
  for qsh_warn_text; do
    qsh_warn_message="$qsh_warn_message $qsh_warn_text"
  done
  qsh_warn_message=$qsh_warn_message.

  printf '%s\n' "$qsh_warn_message" >&2

}
