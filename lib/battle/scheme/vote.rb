require 'battle/scheme'
require 'battle/scheme/item'

module Battle
  class Scheme
    class Vote < Scheme
      store     :votes
      attribute :item_id, Swift::Type::Integer
      attribute :value,   Swift::Type::Boolean

      def item; Item.get id: group_id end
    end
  end
end
