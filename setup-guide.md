# Post-Install Setup Guide

Manual steps and configurations for setting up a new Fedora system.

## Tailscale

Installation instructions: https://tailscale.com/download/linux/fedora

## Claude Code Installation

For full setup instructions, visit: https://code.claude.com/docs/en/setup

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

## Zsh as Default Shell

To set zsh as the default shell for current user:

```bash
chsh -s $(which zsh)
```

Log out and log back in for the change to take effect.
