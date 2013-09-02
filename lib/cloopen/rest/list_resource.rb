module Cloopen
  module REST
    class ListResource
      include Utils

      attr_reader :uri, :instance_key

      def initialize(uri, client)
        @uri, @client = uri, client
        @instance_key ||= self.class.name.split('::')[-1]

        resource_name = self.class.name.split('::')[-1]
        @instance_class = Cloopen::REST.const_get resource_name.chop
      end

      def inspect
        "<#{self.class} @uri='#{@uri}'>"
      end

      def create(params={})
        raise "Can't create a resource without a REST Client" unless @client
        response = @client.post self, params
        @instance_class.new @uri, @client, response
      end
    end
  end
end
