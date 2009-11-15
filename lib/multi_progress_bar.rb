require 'ncurses'
require 'progressbar'
require 'delegate'
require 'abstraction'

module MultiProgressBar
  BARS = []

  class << self
    def start
      Ncurses.initscr
      @bars_window = Ncurses::WINDOW.new(1, 0, Ncurses.LINES-1, 0)
    end

    def end
      Ncurses.endwin
    end

    def width
      @bars_window.getmaxx
    end

    def add_bar(bar)
      BARS << bar

      @bars_window.mvwin(Ncurses.LINES-BARS.size, @bars_window.getbegx)
      @bars_window.resize(BARS.size, @bars_window.getmaxx)
      @bars_window.refresh
    end

    def update_bar(bar, rendered_bar)
      @bars_window.move(BARS.index(bar), 0)
      @bars_window.addstr(rendered_bar)
      @bars_window.refresh
    end
  end
end

require 'multi_progress_bar/bar_renderer'
require 'multi_progress_bar/bar'
require 'multi_progress_bar/progress_bar'
require 'multi_progress_bar/total_bar'
