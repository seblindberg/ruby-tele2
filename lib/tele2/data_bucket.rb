# frozen_string_literal: true

module Tele2
  class DataBucket < Bucket
    
    # Match
    #
    # Returns true if the given raw bucket represents a DataBucket.
    
    def self.match(bucket)
      bucket['bucketType'] == 4
    end
  
    def initialize(bucket)
      @label = bucket['description']
      @total = Data.new bucket['total']
      @used = Data.new (bucket['usedPercentage'] / 100 * @total)
    end
  end
end
