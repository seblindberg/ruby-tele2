# frozen_string_literal: true

require 'json'

module Tele2
  class Bucket
    attr_reader :label, :total, :used
  
    class << self
      # From JSON
      #
      # Parse the JSON representation of a list of buckets and transform each
      # list item to a matching Bucket object.
      
      def from_json(json)
        list = JSON.parse json
        list['listOfBuckets'].map do |bucket_json|
          klass = @buckets.detect { |k| k.match bucket_json } || self
          klass.new bucket_json
        end
      end

      private def inherited(klass)
        (@buckets ||= []) << klass
      end
    end
  
    def initialize(bucket)
      @label = bucket['description']
      @total = bucket['total'].to_i
      @used = bucket['used'].to_i
    end
    
    # Remaining
    #
    # Returns the remaining amount of in the bucket.
     
    def remaining
      total - used
    end
    
    # Used Percentage
    #
    # Returns the remaining amount as a percentage (0..100.0).
    
    def used_percentage
      used.to_f / total.to_f * 100
    end
  
    # To String
    #
    # Format the bucket as a descriptive string detailing what is in the bucket.
    
    def to_s
      format "%s:\n%s left of %s (%.1f%%)",
        label,
        remaining,
        total,
        used_percentage
    end
  end
end
