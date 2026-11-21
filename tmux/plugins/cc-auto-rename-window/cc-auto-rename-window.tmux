#!/usr/bin/env bash
# Names tmux windows after the Claude Code session title.
#
# Claude Code publishes the session name (set by /rename, or restored on
# --resume/--continue) as the terminal title via OSC, which tmux exposes as
# #{pane_title}, prefixed by a status glyph ("✳ name"). While the active pane
# runs Claude, the window is named from that title; otherwise the configured
# fallback format applies.
#
# Options:
#   @cc-auto-rename-window-command  regex matching Claude's process name
#                                (the binary is named after its version, e.g. 2.1.325)
#   @cc-auto-rename-window-fallback format used for non-Claude panes
#   @cc-auto-rename-window-max      truncate the name to N characters (0 = no limit)

get_opt() {
  local value
  value="$(tmux show-option -gqv "$1")"
  printf '%s' "${value:-$2}"
}

command_re="$(get_opt @cc-auto-rename-window-command '^([0-9]+\.[0-9]+\.[0-9]+|claude)$')"
fallback="$(get_opt @cc-auto-rename-window-fallback '#{?pane_in_mode,[tmux],#{pane_current_command}}#{?pane_dead,[dead],}')"
max="$(get_opt @cc-auto-rename-window-max 0)"

strip='s/^[^A-Za-z0-9 ]+ //'
if [ "$max" -gt 0 ] 2>/dev/null; then
  title="#{=${max};${strip}:pane_title}"
else
  title="#{${strip}:pane_title}"
fi

placeholder="$(get_opt @cc-auto-rename-window-placeholder 'claude')"
title="#{?#{||:#{==:#{pane_title},#{host}},#{==:#{pane_title},#{host_short}}},${placeholder},${title}}"

tmux set-option -g automatic-rename on
tmux set-option -g automatic-rename-format "#{?#{m/r:${command_re},#{pane_current_command}},${title},${fallback}}"
