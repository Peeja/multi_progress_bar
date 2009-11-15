require 'ncurses'
require 'progressbar'
require 'delegate'

module MultiProgressBar
  class << self
    def start
      Ncurses.initscr
    end
    
    def end
      Ncurses.endwin
    end
  end
end

require 'multi_progress_bar/bar_renderer'
require 'multi_progress_bar/bar'
