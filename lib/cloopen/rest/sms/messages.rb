module Cloopen
  module REST

    class Messages < ListResource
      def initialize(uri, client)
        @instance_key = 'SMSMessages'
        super uri, client
      end
    end

    class Message < InstanceResource
    end

  end
end
