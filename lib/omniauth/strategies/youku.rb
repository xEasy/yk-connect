# encoding: utf-8
require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Youku < OmniAuth::Strategies::OAuth2
      option :name, "Youku"

      option :client_options, {
        :site => 'https://openapi.youku.com/',
        :authorize_url => 'https://openapi.youku.com/v2/oauth2/authorize',
        :token_url => "https://openapi.youku.com/v2/oauth2/token"
      }

      uid do 
        raw_info['id']
      end

      info do
        raw_info
      end

      def signed_params
        {
          'client_id' => client.id,
          'access_token' => access_token.token,
        }
      end

      def raw_info
        @raw_info ||= begin
          body = RestClient.post('https://openapi.youku.com/v2/users/myinfo.json', {
            "client_id" => client.id,
            'access_token' => access_token.token
          })
          MultiJson.load(body)
        end
      end
    end
  end
end

OmniAuth.config.add_camelization('youku', 'Youku')
