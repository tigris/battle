require 'battle/scheme/vote'

module Battle
  class Vote < Scheme::Vote
    PREPARED_STATEMENTS = {
      count:   Battle.db.prepare(
        %q{select coalesce(sum(value::integer*2 - 1)) as count from votes where item_id = ?}
      ),
      popular: Battle.db.prepare(
        %q{
          select
            distinct item_id,
            (
              (select count(*) from votes where value = true and item_id = v.item_id)
              - (select count(*) from votes where value = false and item_id = v.item_id)
            ) as total
          from votes v
          order by total desc
        }
      ),
      hated:   Battle.db.prepare(
        %q{
          select
            distinct item_id,
            (
              (select count(*) from votes where value = true and item_id = v.item_id)
              - (select count(*) from votes where value = false and item_id = v.item_id)
            ) as total
          from votes v
          order by total asc
        }
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
