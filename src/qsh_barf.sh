#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
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
