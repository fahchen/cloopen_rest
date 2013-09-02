module Cloopen
  module REST
    class Sms < InstanceResource
      def initialize(uri, cilent)
        super uri, cilent
        resource :messages
      end
    end
  end
end