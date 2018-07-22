setup() {
  audit_ssh_config="$HOME/Workspace/tools/audit-ssh-client-config/audit-ssh-config.sh"
  tmp_file=$(mktemp)
  cat ../home/.ssh/conf.d/* > "$tmp_file"
}

teardown() {
  rm "$tmp_file"
}

test_ssh_config_to_respect_secure_ssh_guidelines() {
  nb_of_errors=$($audit_ssh_config "$tmp_file" | grep ERROR | wc -l)
  assert_equals 0 $nb_of_errors
}
