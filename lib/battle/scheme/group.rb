require 'battle/scheme'

module Battle
  class Scheme
    class Group < Scheme
      store     :groups
      attribute :id,   Swift::Type::Integer, serial: true, key: true
      attribute :name, Swift::Type::String
    end
  end
end
