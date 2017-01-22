class RankingController < ApplicationController
    def have
      @items = Item.joins(:haves)
      .select("items.*","count(ownerships.id) as haves_count")
      .group("ownerships.item_id")
      .order("count(ownerships.item_id) desc")
      .limit(10)
    end
    
    def want
      @items = Item.joins(:wants)
      .select("items.*","count(ownerships.id) as wants_count")
      .group("ownerships.item_id")
      .order("count(ownerships.item_id) desc")
      .limit(10)
    end
end
