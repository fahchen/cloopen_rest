module Cloopen
  module REST

    class LandingCalls < ListResource
      def initialize(uri, client)
        super uri, client
      end
    end

    class LandingCall < InstanceResource
    end

  end
end
