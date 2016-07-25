# frozen_string_literal: true

module Tele2
  class Bucket
    attr_reader :label, :total, :used
  
    class << self
      def from_json(json)
        json['listOfBuckets'].map do |bucket_json|
          klass = @buckets.detect { |k| k.match bucket_json }
          klass.new bucket_json
        end
      end
  
      def inherited(klass)
        (@buckets ||= []) << klass
      end
    end
  
    def initialize(bucket)
      @label = bucket['description']
      @total = bucket['total'].to_i
      @used = bucket['used'].to_i
    end
    
    def remaining
      total - used
    end
    
    def used_percentage
      used.to_f / total.to_f * 100
    end
  
    def to_s
      format "%s:\n%s left of %s (%.1f%%)",
        label,
        remaining,
        total,
        used_percentage
    end
  end
end
