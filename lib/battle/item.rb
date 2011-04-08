require 'battle/scheme/item'
require 'battle/vote'

module Battle
  class Item < Scheme::Item
    PREPARED_STATEMENTS = {
      random_any:  Battle.db.prepare(
        self,
        %q{select * from items order by random() limit 1}
      ),
      random_with_where: Battle.db.prepare(
        self,
        %q{select * from items where id != ? and group_id = ? order by random() limit 1}
      ),
    }

    def self.random item = nil
      if item.nil?
        PREPARED_STATEMENTS[:random_any].execute.first
      else
        PREPARED_STATEMENTS[:random_with_where].execute(item.id, item.group_id).first
      end
    end

    def self.popular(limit = 10)
      Vote.popular(limit).to_a.map{|row| get id: row[:item_id]}
    end

    def self.hated(limit = 10)
      Vote.hated(limit).to_a.map{|row| get id: row[:item_id]}
    end

    def vote value
      Vote.create item_id: id, value: value
    end

    def upvote;   vote true  end
    def downvote; vote false end

    def vote_count
      Vote.count self
    end
  end
end
