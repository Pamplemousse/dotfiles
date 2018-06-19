source "$HOME/.aliases/python"
shopt -s expand_aliases

test_python() {
  (python --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_http_prompt() {
  (http-prompt --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_yamllint() {
  (yamllint --version) > /dev/null 2>&1
  assert_equals 0 $?
}
