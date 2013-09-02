module Cloopen
  module REST
    class Response
      STATUS_CODE_DESCRIPTIONS = YAML.load_file("conf/status_code_descriptions.yml")

      attr_reader :status, :status_code, :body
      def initialize(body)
        @body = body
        @status_code = @body.delete(:status_code)
        @status = status_code_descritptions[@status_code]
      end

      private
      def status_code_descritptions
        hash = STATUS_CODE_DESCRIPTIONS
        hash.default = 'unknow_error'
        hash.merge({'000000' => 'succeeds'})
      end
    end
  end
end