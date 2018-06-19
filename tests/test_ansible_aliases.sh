source "../home/.aliases/ansible"
shopt -s expand_aliases

test_ansible() {
  (ansible --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_ansible_galaxy() {
  (ansible-galaxy --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_ansible_playbook() {
  (ansible-playbook --version) > /dev/null 2>&1
  assert_equals 0 $?
}

test_ansible_vault() {
  (ansible-vault --version) > /dev/null 2>&1
  assert_equals 0 $?
}
