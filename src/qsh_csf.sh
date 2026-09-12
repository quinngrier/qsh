#
# This file is published under the CC0 Public Domain Dedication.
#
# shellcheck shell=sh
#

qsh_csf() {

  case $# in (0)
    cat
    echo csf
  ;; (*)
    for qsh_csf_var; do
      eval "
        $qsh_csf_var=\${$qsh_csf_var%csf}
        $qsh_csf_var=\${$qsh_csf_var%'
'}
      "
    done
  esac

}
