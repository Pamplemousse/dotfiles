Describe "ruby related commands"
  setup() {
    source "$(pwd)/home/.aliases/ruby"
  }

  BeforeAll 'setup'

  Parameters
    bundle
    rubocop
    ruby
  End

  run_command() { "$1" --version >/dev/null 2>&1; }

  Example "has '$1' available"
    When call run_command "$1"
    The status should be success
  End
End
