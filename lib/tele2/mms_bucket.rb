# frozen_string_literal: true

module Tele2
  class MMSBucket < Bucket
    
    # Match
    #
    # Returns true if the given raw bucket represents a MMSBucket.
    
    def self.match(bucket)
      bucket['bucketType'] == 0 && bucket['description'] == 'MMS'
    end
    
    def initialize(bucket)
      @label = bucket['description']
      @total = MMS.new bucket['total']
      @used = MMS.new (bucket['usedPercentage'] / 100 * @total)
    end
  end
end
