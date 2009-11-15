#!/usr/bin/env ruby

require 'rubygems'

$LOAD_PATH.unshift File.dirname(__FILE__)+"/lib"
require 'multi_progress_bar'


begin
  MultiProgressBar.start

  # Demo.
  bleeker  = MultiProgressBar::ProgressBar.new("bleeker", 100)
  montrose = MultiProgressBar::ProgressBar.new("montrose", 100)
  total    = MultiProgressBar::TotalBar.new("-Total-")

  until bleeker.current == bleeker.total && montrose.current == montrose.total
    sleep(0.1)
    bleeker.inc(rand(10))
    montrose.inc(rand(5))
    montrose.title = "montrose-#{rand(5)}"
    MultiProgressBar.log(rand(2000))
  end
ensure
  MultiProgressBar.end
end
