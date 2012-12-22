module Support
  module Vim
    def tocdown_toggle
      vim.command 'TocdownToggle'
      vim.command 'wincmd w'
    end

    def tocdown_window_contents
      raw_result = vim.echo(%w[getbufline('%', 2, line('$'))])
      normalize_string(eval(raw_result).join("\n"))
    end
  end
end
