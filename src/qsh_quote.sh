#
# This file is published under the CC0 Public Domain Dedication.
#

qsh_quote() {

  case ${QSH_NDEBUG+1} in ("")
    case $# in (0)
      qsh_barf "qsh_quote:" \
        "At least one argument must be given" \
      ;
    esac
  esac

  qsh_quote_dst=$1
  shift

  case ${QSH_NDEBUG+1} in ("")
    case $qsh_quote_dst in ("" | *[!0-9A-Z_a-z]* | [0-9]*)
      qsh_barf "qsh_quote:" \
        "Invalid <&dst>: \"$qsh_quote_dst\"" \
      ;
    esac
  esac

  qsh_quote_v=

  for qsh_quote_x; do

    case $qsh_quote_v in ("")
      qsh_quote_v=\'
    ;; (*)
      qsh_quote_v="$qsh_quote_v '"
    esac

    while :; do
      case $qsh_quote_x in (*\'*)
        qsh_quote_v=$qsh_quote_v${qsh_quote_x%%\'*}"'\\''"
        qsh_quote_x=${qsh_quote_x#*\'}
      ;; (*)
        qsh_quote_v=$qsh_quote_v$qsh_quote_x\'
        break
      esac
    done

  done

  eval "$qsh_quote_dst=\$qsh_quote_v"

}
