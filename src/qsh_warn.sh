#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

qsh_warn() {

  case $# in (0)
    set "Unknown warning"
  esac

  qsh_warn_message="$0: Warning:"
  for qsh_warn_arg; do
    qsh_warn_message="$qsh_warn_message $qsh_warn_arg"
  done
  qsh_warn_message=$qsh_warn_message.

  printf '%s\n' "$qsh_warn_message" >&2

}
