Describe "node related commands (implemented via functions)"
  setup() {
    source "$(pwd)/home/.aliases/nodejs"
  }

  BeforeAll 'setup'

  Parameters
    jsdoc
    node
    npm
    prettier
    standard
    yarn
  End

  run_command() { "$1" --version >/dev/null 2>&1; }

  Example "has '$1' available"
    When call run_command "$1"
    The status should be success
  End
End

# Due to the implementation of `shellspec`, the expansion of the alias need to be forced, hence the separate block:
# https://github.com/shellspec/shellspec/issues/106#issuecomment-701344407 .
Describe "node related commands (implemented via aliases)"
  setup() {
    source "$(pwd)/home/.aliases/nodejs"
  }

  BeforeAll 'setup'

  Parameters
    http-server
    json-server
    livedown
  End

  run_command() { eval "$1" --version >/dev/null 2>&1; }

  Example "has '$1' available"
    When call run_command "$1"
    The status should be success
  End
End
