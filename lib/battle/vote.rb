require 'battle/scheme/vote'

module Battle
  class Vote < Scheme::Vote
    PREPARED_STATEMENTS = {
      count: Battle.db.prepare(
        %q{select count(*) as count from votes where item_id = ?}
      ),
      popular:           Battle.db.prepare(
        %q{select item_id, count(*) as count from votes group by item_id order by count asc limit ?}
      ),
      hated:             Battle.db.prepare(
        %q{select item_id, count(*) as count from votes group by item_id order by count desc limit ?}
      ),
    }

    def self.count item
      PREPARED_STATEMENTS[:count].execute(item.id).first[:count]
    end

    def self.popular(limit = 10)
      PREPARED_STATEMENTS[:popular].execute(limit)
    end

    def self.hated(limit = 10)
      PREPARED_STATEMENTS[:hated].execute(limit)
    end
  end
end
