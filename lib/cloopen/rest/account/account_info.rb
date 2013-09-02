module Cloopen
  module REST
    class AccountInfo < InstanceResource
      def get
        raise "Can't create a resource without a REST Client" unless @client
        response = @client.get self
        self.class.new @uri, @client, response
      end
    end
  end
end