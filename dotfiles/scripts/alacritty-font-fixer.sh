#!/usr/bin/env bash

set -o pipefail
# shellcheck disable=SC2154
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

CONFIG_DIR="$XDG_CONFIG_HOME/alacritty"

CONFIG_FILE="${CONFIG_DIR}/alacritty.yml"
CONFIG_SM_FILE="${CONFIG_DIR}/alacritty.small.yml"


get_focused_width() {
        output_name=$(i3-msg -t get_tree --raw | jq -r '..|select(.focused?)|select(.focused==true)|.output')
        i3-msg -t get_outputs --raw | jq -r $(printf '..|select(.name?)|select(.name=="%s")|.rect.y' "$output_name")
}

is_focused_primary() {
	y_position="$(get_focused_width)"
	test "$y_position" -le '1' && echo 1 || echo 0
}

_config="${CONFIG_FILE}"
#_is_primary="$(is_focused_primary)"
test "$(is_focused_primary)" -eq 1 && _config="${CONFIG_FILE}" || _config="${CONFIG_SM_FILE}"

echo "focused width: $(get_focused_width)"
echo "is primary: $(is_focused_primary)"
echo "using: ${_config}"

cmd=$(printf 'exec "alacritty --config-file=%s"' "$_config")
i3-msg "$cmd"
