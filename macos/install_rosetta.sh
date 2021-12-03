#!/bin/bash

# Check to see if the Mac needs Rosetta installed by testing the processor
processor=$(/usr/sbin/sysctl -n machdep.cpu.brand_string | grep -o "Intel")

if [[ -n "$processor" ]]; then
  echo "$processor processor installed. No need to install Rosetta."
else

  # Check for Rosetta "oahd" process. If not found,
  # perform a non-interactive install of Rosetta.

  if /usr/bin/pgrep oahd >/dev/null 2>&1; then
      echo "Rosetta is already installed and running. Nothing to do."
  else
      /usr/sbin/softwareupdate --install-rosetta --agree-to-license

      if [[ $? -eq 0 ]]; then
          echo "Rosetta has been successfully installed."
      else
          echo "Rosetta installation failed!"
      fi
  fi
fi
else
  echo "Mac is running macOS $osvers_major.$osvers_minor.$osvers_dot_version."
  echo "No need to install Rosetta on this version of macOS."
