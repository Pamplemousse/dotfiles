source "$HOME/.aliases/ruby"
shopt -s expand_aliases

test_ruby() {
  (ruby -v) > /dev/null 2>&1
  assert_equals 0 $?
}

test_bundle() {
  (bundle version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_rubocop() {
  (rubocop --version) > /dev/null 2>&1
  assert_equals 0 $?
}
