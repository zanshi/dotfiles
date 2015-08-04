#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
#import netifaces
import basiciw
import time
import datetime
import re

from jsonpath_rw import jsonpath, parse

import volume_control
import executor
from color_definitions import colors
from gradient import get_color_gradient
from status_block import StatusBlock, StatusUnit

TOP_BORDER_WIDTH = 2

def blockify_active_window():
  """ Print the currently active window (or 'none'). """

  active_window, return_code = executor.run('xdotool getactivewindow getwindowname')
  if return_code != 0:
    return None
  if len(active_window) > 100:
    active_window = active_window[:80] + '...' + active_window[-20:]

  block = StatusUnit('active-window')
  block.set_icon('')
  block.set_text(active_window)

  return block.to_json()

def blockify_volume():
  """ Print the current volume. """

  block = StatusUnit('volume')
  block.icon_block.set_name('toggle-volume')

  status = volume_control.status()
  if status == "on":
    volume = int(volume_control.get_volume())
    if volume > 80:
      block.set_icon('')
    elif volume > 40:
      block.set_icon('')
    else:
      block.set_icon('')

    block.set_text(str(volume) + '%')

    color = get_color_gradient(volume, [
      { 'threshold': 0,   'color': colors['urgent'] },
      { 'threshold': 100, 'color': colors['blue'] },
      { 'threshold': 101, 'color': colors['yellow'] },
      { 'threshold': 200, 'color': colors['yellow'] } ])
    block.set_border(color, 0, TOP_BORDER_WIDTH, 0, 0)
    block.status_block.set_min_width(40, 'right')
  else:
    block.set_icon('')
    block.set_text('muted')
    block.set_urgent()
    block.status_block.set_name('toggle-volume')

  return block.to_json()

def blockify_date():
  """ Prints the date and time. """

  now = datetime.datetime.now()

  calendar = StatusUnit('calendar')
  calendar.set_icon('')
  calendar.set_text(now.strftime('%a., %d. %b. %Y'))
  return calendar.to_json()

def blockify_time():
  """ Prints the time. """

  now = datetime.datetime.now()

  clock = StatusUnit('clock')
  clock.set_icon('')
  clock.set_text(now.strftime('%H:%M:%S'))
  return clock.to_json()

def blockify_separator():
  block = StatusBlock('separator')
  block.set_full_text('    ')
  block.set_color(colors['yellow'])
  block.set_separator(False, 0)
  return block.to_json()

#########################################
### MAIN ################################
#########################################

if __name__ == '__main__':
  blocks = [
    blockify_active_window(),
    blockify_volume(),
    blockify_date(),
    blockify_time()
  ]

  separator = ',' + blockify_separator() + ','
  json = separator.join(block for block in blocks if block)

  sys.stdout.write(json)
  sys.stdout.flush()
