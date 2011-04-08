require 'battle/scheme'
require 'battle/scheme/group'

module Battle
  class Scheme
    class Item < Scheme
      store     :items
      attribute :id,       Swift::Type::Integer, serial: true, key: true
      attribute :name,     Swift::Type::String
      attribute :group_id, Swift::Type::Integer

      def group; Group.get id: group_id end
    end
  end
end
