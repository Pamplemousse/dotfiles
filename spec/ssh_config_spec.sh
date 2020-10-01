Describe 'ssh client configuration'
  setup() {
    audit_ssh_config="$HOME/Workspace/tools/audit-ssh-client-config/audit-ssh-config.sh"
    tmp_file=$(mktemp)
    cat "$(pwd)"/home/.ssh/conf.d/* > "$tmp_file"
  }

  teardown() {
    rm "$tmp_file"
  }

  Before 'setup'
  After 'teardown'

  run_audit_on() { $audit_ssh_config "$1" | grep -c ERROR; }

  It 'respects hardening rules'
    When call run_audit_on "$tmp_file"
    The output should eq 0
    # Result of the `grep` should be a `failure`.
    The status should be failure
  End
End
