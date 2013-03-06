# encoding: utf-8

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Youku < OmniAuth::Strategies::OAuth2
      option :name, "youku"

      option :client_options, {
        :site => 'https://openapi.youku.com/v2/',
        :authorize_url => '/oauth2/authorize',
        :token_url => "/oauth2/token"
      }

      option :token_params, {
        :state => 'foobar',
        :parse => :query
      }

      option :authorize_options, [:scope]

      uid do
        @uid ||= begin
          access_token.options[:mode] = :query
          access_token.options[:param_name] = :access_token
          response = access_token.get('/users/myinfo')
          matched = response.body.match(/"id":"(\w+)"/)
          matched[:id]
        end
      end

      info do
        {
          :name => raw_info['name'],
          :image => raw_info['avatar'],
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        @raw_info ||= begin
          access_token.get('/users/myinfo', :parse => :json).parsed
        end
      end
    end
  end
end

OmniAuth.config.add_camelization('qq_connect', 'QQConnect')
