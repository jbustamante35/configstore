#!/bin/bash
#Post Hook: default-zip
function __sdkman_post_installation_hook {
    __sdkman_echo_debug "No Linux post-install hook found for Kotlin 1.2.61."
    __sdkman_echo_debug "Moving $binary_input to $zip_output"
    mv "$binary_input" "$zip_output"
}