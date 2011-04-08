require File.join(File.dirname(__FILE__), '..', 'battle')

module Battle
  module Cli
    def self.bin
      File.basename($0).gsub(/-/, ' ')
    end

    def self.root
      File.expand_path(File.join(Battle.root, 'bin'))
    end
  end
end
