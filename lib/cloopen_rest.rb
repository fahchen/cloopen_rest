require 'multi_xml'
require 'json'
require 'rest_client'
require 'builder'
require 'net/http'
require 'digest/md5'
require 'base64'

require 'cloopen/version'
require 'cloopen/rest/utils'
require 'cloopen/rest/response'
require 'cloopen/rest/instance_resource'
require 'cloopen/rest/list_resource'
require 'cloopen/rest/account/account_info'
require 'cloopen/rest/account/sub_accounts'
require 'cloopen/rest/account'
require 'cloopen/rest/sms/messages'
require 'cloopen/rest/sms'
require 'cloopen/rest/call/landing_calls'
require 'cloopen/rest/calls'
require 'cloopen/rest/client'

module Cloopen
  def self.env
    ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'
  end
end
