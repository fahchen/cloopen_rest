module Cloopen
  module REST
    class InstanceResource
      include Utils

      attr_reader :uri

      def initialize(uri, client, params=nil)
        @uri, @client = uri, client
        params and set_up_properties_from params
      end

      def inspect
        "<#{self.class} @uri='#{@uri}'>"
      end

      protected

      def set_up_properties_from(hash)
        hash.each do |p,v|
          property = decloopfy p
          response_body = prase_body v
          unless ['uri', 'client'].include? property
            instance_variable_set "@#{property}", Cloopen::REST::Response.new(response_body)
          end
          self.class.instance_eval {attr_reader property}
        end
      end

      def resource(*resources)
        resources.each do |r|
          resource = cloopfy r
          relative_uri = r == :sms ? 'SMS' : resource
          uri = "#{@uri}/#{relative_uri}"
          resource_class = Cloopen::REST.const_get resource
          instance_variable_set("@#{r}", resource_class.new(uri, @client))
        end
        self.class.instance_eval {attr_reader *resources}
      end

    end
  end
end
