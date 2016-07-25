# frozen_string_literal: true

module Tele2
  class SMSBucket < Bucket
    
    # Match
    #
    # Returns true if the given raw bucket represents a SMSBucket.
    
    def self.match(bucket)
      bucket['bucketType'] == 0 && bucket['description'] == 'SMS'
    end
    
    def initialize(bucket)
      @label = bucket['description']
      @total = SMS.new bucket['total']
      @used = SMS.new (bucket['usedPercentage'] / 100 * @total)
    end
  end
end
