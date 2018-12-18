#!/bin/bash

# Run both conky configuration scripts
conky -c ~/.config/conky/conky_main &
conky -c ~/.config/conky/conky_func
