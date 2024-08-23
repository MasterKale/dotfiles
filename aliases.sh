alias ping="ping -c 4"
alias flushdns="sudo killall -HUP mDNSResponder"
alias findtext="grep -rnw ./ -e"
alias dc="docker compose"
alias pva="source venv/bin/activate"
alias tower="gittower ."

makerandpass() {
  # A simple command to generate a simple, random password. Think "Webex video link password"
  # quality of output.
  #
  # Args:
  #   $1: number of characters (defaults to 12)
  #
  # Returns:
  #   A random password of the specified length

  # Read the specified length. Default to 12 characters if no length is specified
  DEFAULT_LENGTH=12
  LENGTH="${1:-$DEFAULT_LENGTH}"

  # Generate the new password
  NEW_PASSWORD=$(LC_ALL=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c $LENGTH)

  # Output to console and copy to clipboard
  echo $NEW_PASSWORD | pbcopy
  echo "$NEW_PASSWORD (copied to clipboard)"
}
