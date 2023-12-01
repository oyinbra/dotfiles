#!/bin/bash

source_plugin() {
    local plugin_name="$1"
    local plugin_path="$ZSH_PLUGIN_DIR/$plugin_name/$plugin_name.plugin.zsh"
    local omz_path="$OMZ_PLUGIN_DIR/$plugin_name/$plugin_name.plugin.zsh"
    local plugin_theme="$ZSH_PLUGIN_DIR/$plugin_name/$plugin_name.zsh-theme"

    # Check if the plugin file exists
    if [ -f "$plugin_path" ]; then
        source "$plugin_path"
        # echo "Sourced: $plugin_name"
    else
        # echo "Error: Plugin file not found for $plugin_name"
    fi

    # Check if the omz_path is not empty and the plugin file exists
    if [ -n "$omz_path" ] && [ -f "$omz_path" ]; then
        source "$omz_path"
        # echo "Sourced: $plugin_name"
    else
        # echo "Error: Plugin file not found for $plugin_name"
    fi

    # Check if the theme file exists
    if [ -f "$plugin_theme" ]; then
        source "$plugin_theme"
        # echo "Sourced theme: $plugin_name"
    else
        # echo "Error: Theme file not found for $plugin_name"
    fi
}

# Loop to source plugins
for plugin in "${plugins[@]}"; do
    source_plugin "$(basename "$plugin")"
done

