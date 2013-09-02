module Cloopen
  module REST
    class Calls < InstanceResource
      def initialize(uri, cilent)
        super uri, cilent
        resource :landing_calls
      end
    end
  end
end