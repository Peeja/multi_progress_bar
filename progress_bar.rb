#!/usr/bin/env ruby

require 'rubygems'
require 'ncurses'

begin
  Ncurses.initscr

  # Draw a progress bar
  # 
  # 150/200       75%  [------------------|        ]  ETA: 00:11:05

  ratio = 0.5

  LEFT_WIDTH = 15
  RIGHT_WIDTH = 15
  
  left  = "150/200 %3d%%  [" % (ratio*100)
  right = "]  ETA: 00:11:05"

  bar_width = Ncurses.COLS - left.size - right.size
  filled_width = bar_width * ratio
  bar = "#{"-"*(filled_width-1)}|#{" "*(bar_width-filled_width)}"

  Ncurses.addstr(left)
  Ncurses.addstr(bar)
  Ncurses.addstr(right)
  Ncurses.refresh
ensure
  Ncurses.endwin
end
