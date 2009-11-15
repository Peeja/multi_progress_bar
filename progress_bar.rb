#!/usr/bin/env ruby

require 'rubygems'

$LOAD_PATH.unshift File.dirname(__FILE__)+"/lib"
require 'multi_progress_bar'


begin
  MultiProgressBar.start

  # Logging.
  info_win = Ncurses::WINDOW.new(Ncurses.LINES-1, 0, 1, 0)
  info_win.scrollok(true)
  Kernel.send(:define_method, :log) do |msg|
    info_win.addstr("\n#{msg}")
    info_win.refresh
  end

  bar = MultiProgressBar::Bar.new("lapidge", 100)

  # Demo.
  until bar.current == bar.total do
    sleep(0.1)
    bar.inc(rand(5))
  end
ensure
  MultiProgressBar.end
end
