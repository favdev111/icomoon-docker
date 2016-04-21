# encoding: UTF-8

module Jekyll
  module Drops
    class DocumentDrop < Drop
      extend Forwardable

      mutable false

      def_delegator :@obj, :next_doc, :next
      def_delegator :@obj, :previous_doc, :previous
      def_delegator :@obj, :relative_path, :path
      def_delegators :@obj, :id, :output, :content, :to_s, :relative_path, :url

      def collection
        @obj.collection.label
      end

      def excerpt
        fallback_data['excerpt'].to_s
      end

      def <=>(other)
        return nil unless other.is_a? DocumentDrop
        cmp = self['date'] <=> other['date']
        cmp = self['path'] <=> other['path'] if cmp.nil? || cmp == 0
        cmp
      end

      private
      def_delegator :@obj, :data, :fallback_data
    end
  end
end
