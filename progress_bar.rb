#!/usr/bin/env ruby

require 'rubygems'
require 'ncurses'
gem 'ruby-progressbar'
require 'progressbar'

$LOAD_PATH.unshift File.dirname(__FILE__)+"/lib"
require 'multi_progress_bar/bar_renderer'


begin
  Ncurses.initscr

  info_win = Ncurses::WINDOW.new(Ncurses.LINES-1, 0, 1, 0)
  info_win.scrollok(true)

  Kernel.send(:define_method, :log) do |msg|
    info_win.addstr("\n#{msg}")
    info_win.refresh
  end


  bar_window = Ncurses::WINDOW.new(1, 0, 0, 0)

  bar_renderer = MultiProgressBar::BarRenderer.new("lapidge", 100, bar_window.getmaxx) do |bar|
    bar_window.addstr(bar)
    bar_window.refresh
  end

  # Demo.
  until bar_renderer.current == bar_renderer.total do
    sleep(0.1)
    bar_renderer.inc(rand(5))
  end
ensure
  Ncurses.endwin
end
