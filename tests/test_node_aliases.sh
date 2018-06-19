source "../home/.aliases/nodejs"
shopt -s expand_aliases

test_http_server() {
  (http-server --help) > /dev/null 2>&1
  assert_equals 0 $?
}

test_json_server() {
  (json-server --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_node() {
  (node --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_yarn() {
  (yarn --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_nsp() {
  (nsp --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_standard() {
  (standard --version) > /dev/null 2>&1
  assert_equals 0 $?
}
