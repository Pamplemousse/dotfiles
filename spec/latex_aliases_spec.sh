Describe "ansible related commands"
  setup() {
    source "$(pwd)/home/.aliases/latex"
  }

  BeforeAll 'setup'

  Parameters
    bibtex
    pdflatex
  End

  run_command() { "$1" --version >/dev/null 2>&1; }

  Example "has '$1' available"
    When call run_command "$1"
    The status should be success
  End
End
