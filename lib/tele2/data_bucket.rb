# frozen_string_literal: true

module Tele2
  class DataBucket < Bucket
    def self.match(json)
      json['bucketType'] == 4
    end
  
    def initialize(bucket)
      @label = bucket['description']
      @total = Data.new bucket['total']
      @used = Data.new (bucket['usedPercentage'] / 100 * @total)
    end
  end
end
