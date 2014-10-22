module FaradayCharacterEncoding
  class BodyEncoder < Faraday::Middleware

    attr_reader :response_env

    def call(env)
      @app.call(env).on_complete do |response_env|
        @response_env = response_env
        handle_encoding
      end
    end

    private

    def content_type
      Array(response_env[:response_headers][:content_type]).first
    end

    def content_charset
      if match = /;\s*charset=\s*(?<charset>.+?)\s*(;|$)/.match(content_type)
        match['charset']
      end
    end

    def content_encoding
      if charset = content_charset
        Encoding.find(charset)
      end
    rescue ArgumentError
      nil
    end

    def handle_encoding
      if encoding = content_encoding
        response_env[:body].force_encoding(encoding)
      end
    end

  end
end
