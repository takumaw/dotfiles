#!/bin/bash
#
# Config initializer
#
# See also: https://dotfiles.github.io/tutorials/
#

set -eEu -o pipefail

# Repository path relative to $HOME. Keeping it relative makes every symlink
# below relative too, so the repo works wherever it lives under home
# (~/Config, ~/Config/Profiles/<name>, ...) without editing this script.
REPO_DIR=${PWD#"$HOME"/}

# Move to the home directory
cd "${HOME}"

# Replace any existing target before linking. The -L test also catches a
# dangling symlink, which -e alone would miss, so re-running is always safe.
symlink() {
    [[ -e "$2" || -L "$2" ]] && rm "$2"
    ln -s "$1" "$2"
}

# Create symlinks
symlink "${REPO_DIR}/Editor/tmux.conf" .tmux.conf
symlink "${REPO_DIR}/Editor/.vimrc" .vimrc

symlink "${REPO_DIR}/Git/.gitconfig" .gitconfig
symlink "${REPO_DIR}/Git/.gitignore_global" .gitignore_global

symlink "${REPO_DIR}/Shell/.zshrc" .zshrc

symlink "${REPO_DIR}/SSH" .ssh
find "${REPO_DIR}/SSH" -type d -exec chmod 700 {} +
find "${REPO_DIR}/SSH" -type f -exec chmod 600 {} +

if [[ -d .claude ]]; then
    symlink "../${REPO_DIR}/Agents/AGENTS.md" .claude/CLAUDE.md
    symlink "../${REPO_DIR}/Agents/skills" .claude/skills
fi

if [[ -d .gemini ]]; then
    mkdir -p .gemini/config
    symlink "../../${REPO_DIR}/Agents/AGENTS.md" .gemini/config/AGENTS.md
    symlink "../../${REPO_DIR}/Agents/skills" .gemini/config/skills
fi
