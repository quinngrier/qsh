#
# This file is licensed under the MIT No Attribution license.
#
# shellcheck shell=sh
#

qsh_unknown_operand() {

  case ${QSH_NDEBUG+1} in ("")
    case $# in (0)
      qsh_barf "qsh_unknown_operand:" \
        "At least one argument must be given" \
      ;
    esac
  esac

  qsh_barf "Unknown operand: \"$1\""

}
