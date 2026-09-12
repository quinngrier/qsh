#
# This file is published under the CC0 Public Domain Dedication.
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
