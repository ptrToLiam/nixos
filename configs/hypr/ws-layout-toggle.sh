#!/usr/bin/env bash

current_layout=$(hyprctl activeworkspace | awk '/tiledLayout/ {print $2}' | tail -1)

tgt_layout=$( [ "$current_layout" == 'scrolling' ] &&
              echo 'pseudo' || echo 'scrolling' )

ws_id=$(hyprctl activeworkspace | awk 'NR==1 && /workspace ID/ {print $3}')
hyprctl keyword workspace "$ws_id, layout:$tgt_layout"