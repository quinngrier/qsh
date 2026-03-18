#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#

qsh_parse_option() {

  case ${QSH_NDEBUG+1} in ("")
    case $# in (0)
      qsh_barf "qsh_parse_option:" \
        "At least one <option> must be given" \
      ;
    esac
  esac

  case $1 in (-? | --*)
    qsh_parse_option_prefix=qsh_parse_option_
  ;; *)
    qsh_parse_option_prefix=$1
    case ${QSH_NDEBUG+1} in ("")
      case ${qsh_parse_option_prefix} in (*[!0-9A-Z_a-z]* | [0-9]*)
        qsh_barf "qsh_parse_option:" \
          "Invalid <prefix>: \"$qsh_parse_option_prefix\"" \
        ;
      esac
    esac
    shift
  esac

  qsh_parse_option_opts_n=0
  while :; do
    case $# in (0)
      break
    esac
    case ${QSH_NDEBUG+1} in ("")
      case $1 in (--*=*)
        qsh_barf "qsh_parse_option:" \
          "Invalid <option>: \"$1\"" \
        ;
      esac
    esac
    case $1 in (-? | --*)
      eval qsh_parse_option_opts_$qsh_parse_option_opts_n=\$1
      qsh_parse_option_opts_n=$(($qsh_parse_option_opts_n + 1))
      shift
    ;; (*)
      break
    esac
  done

  case ${QSH_NDEBUG+1} in ("")
    case $qsh_parse_option_opts_n in (0)
      qsh_barf "qsh_parse_option:" \
        "At least one <option> must be given" \
      ;
    esac
  esac

  case ${QSH_NDEBUG+1} in ("")
    case $# in (0)
      qsh_barf "qsh_parse_option:" \
        "The argument list must be given" \
      ;
    esac
  esac

  case $1 in (required | forbidden | permitted)
    qsh_parse_option_style=$1
    shift
  ;; (*)
    qsh_parse_option_style=required
  esac

  case ${QSH_NDEBUG+1} in ("")
    case $# in (0)
      qsh_barf "qsh_parse_option:" \
        "The argument list must be given" \
      ;
    esac
  esac

  case ${QSH_NDEBUG+1} in ("")
    case $1 in (:)
      :
    ;; (*)
      qsh_barf "qsh_parse_option:" \
        "Unexpected argument: \"$1\"" \
      ;
    esac
  esac
  shift

  qsh_parse_option_opts_i=0

  while :; do

    case $qsh_parse_option_opts_i in ($qsh_parse_option_opts_n)
      break
    esac

    case $# in (0)
      break
    esac

    eval qsh_parse_option_opt=\$qsh_parse_option_opts_$qsh_parse_option_opts_i

    case $1 in ("$qsh_parse_option_opt")
      eval ${qsh_parse_option_prefix}got=1
      eval ${qsh_parse_option_prefix}opt=\$qsh_parse_option_opt
      case $qsh_parse_option_style in (required)
        case $# in (1)
          qsh_barf \
            "Option requires an argument: $qsh_parse_option_opt" \
          ;
        esac
        eval ${qsh_parse_option_prefix}arg=\$2
        eval ${qsh_parse_option_prefix}pop=shift
      ;; (*)
        unset ${qsh_parse_option_prefix}arg
        eval ${qsh_parse_option_prefix}pop=
      esac
      return
    esac

    case $qsh_parse_option_opt in (--*)

      case $1 in ("$qsh_parse_option_opt"=*)
        case $qsh_parse_option_style in (forbidden)
          qsh_barf \
            "Option forbids an argument: $qsh_parse_option_opt" \
          ;
        esac
        eval ${qsh_parse_option_prefix}got=1
        eval ${qsh_parse_option_prefix}opt=\$qsh_parse_option_opt
        eval ${qsh_parse_option_prefix}arg='${1#*=}'
        eval ${qsh_parse_option_prefix}pop=
        return
      esac

    ;; (*)

      case $1 in ("$qsh_parse_option_opt"*)
        eval ${qsh_parse_option_prefix}got=1
        eval ${qsh_parse_option_prefix}opt=\$qsh_parse_option_opt
        case $qsh_parse_option_style in (forbidden)
          unset ${qsh_parse_option_prefix}arg
          eval ${qsh_parse_option_prefix}pop=\''
            qsh_parse_option_tmp=$1
            shift
            set -- tmp -"${qsh_parse_option_tmp#??}" "$@"
          '\'
        ;; *)
          eval ${qsh_parse_option_prefix}arg='${1#??}'
          eval ${qsh_parse_option_prefix}pop=
        esac
        return
      esac

    esac

    qsh_parse_option_opts_i=$(($qsh_parse_option_opts_i + 1))

  done

  eval ${qsh_parse_option_prefix}got=0
  unset ${qsh_parse_option_prefix}opt
  unset ${qsh_parse_option_prefix}arg
  eval ${qsh_parse_option_prefix}pop=

}
