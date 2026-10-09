#!/usr/bin/env bash
# Helicon - deploy configs by symlinking them into place.
# Existing files are moved to <target>.helicon-bak first.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
BIN_HOME="$HOME/.local/bin"

link() {
	local src=$1 dst=$2
	if [[ -L $dst ]]; then
		rm "$dst"
	elif [[ -e $dst ]]; then
		mv "$dst" "$dst.helicon-bak"
		echo "backed up $dst -> $dst.helicon-bak"
	fi
	mkdir -p "$(dirname "$dst")"
	ln -s "$src" "$dst"
	echo "linked $dst"
}

for entry in "$REPO"/config/*; do
	link "$entry" "$CONFIG_HOME/$(basename "$entry")"
done

mkdir -p "$BIN_HOME"
for entry in "$REPO"/bin/*; do
	link "$entry" "$BIN_HOME/$(basename "$entry")"
done

LOGIND_DROPIN=/etc/systemd/logind.conf.d/10-helicon-powerkey.conf
if ! cmp -s "$REPO/system/logind.conf.d/10-helicon-powerkey.conf" "$LOGIND_DROPIN"; then
	sudo install -Dm644 "$REPO/system/logind.conf.d/10-helicon-powerkey.conf" "$LOGIND_DROPIN"
	sudo systemctl kill -s HUP systemd-logind
	echo "installed $LOGIND_DROPIN"
fi

echo
echo "Done. Reload with: pkill -SIGUSR2 waybar; makoctl reload; hyprctl reload"
