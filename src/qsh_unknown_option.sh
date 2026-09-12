#
# This file is published under the CC0 Public Domain Dedication.
#
# shellcheck shell=sh
#

qsh_unknown_option() {

  case ${QSH_NDEBUG+1} in ("")
    case $# in (0)
      qsh_barf "qsh_unknown_option:" \
        "At least one argument must be given" \
      ;
    esac
  esac

  case $1 in (--*)
    qsh_barf "Unknown option: \"${1%%=*}\""
  ;; (-?*)
    qsh_unknown_option_tmp=${1#??}
    qsh_unknown_option_tmp=${1%"$qsh_unknown_option_tmp"}
    qsh_barf "Unknown option: \"$qsh_unknown_option_tmp\""
  esac

}
