root = File.join(File.dirname(__FILE__), '..')
$:.unshift File.join(root, 'lib')

require 'bundler'
Bundler.setup(:default)

require 'swift'

Encoding.default_internal = 'UTF-8'
Encoding.default_external = 'UTF-8'

Swift.setup(:default, Swift::DB::Postgres, db: 'battle')

module Battle
  def self.root
    File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end

  def self.db(*args, &block)
    Swift.db(*args, &block)
  end
end
