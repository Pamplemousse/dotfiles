source "../home/.aliases/latex"
shopt -s expand_aliases

test_pdflatex() {
  (pdflatex --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_bibtex() {
  (bibtex --version) > /dev/null 2>&1
  assert_equals 0 $?
}
