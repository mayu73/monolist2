class RankingController < ApplicationController
    def have
      @items = Item.joins(:haves)
      .select("items.*","count(ownerships.id) as haves_count")
      .group("items.id")
      .order("haves_count desc")
      .limit(10)
    end
    
    def want
      @items = Item.joins(:wants)
      .select("items.*","count(ownerships.id) as wants_count")
      .group("item_id")
      .order("wants_count desc")
      .limit(10)
    end
end
