# vim: syntax=ruby
require ::File.join(::File.dirname(__FILE__), 'lib/battle')
require 'battle/web'
require 'battle/web/admin'

map('/')      { run Battle::Web        }
map('/admin') { run Battle::Web::Admin }
