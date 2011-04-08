module Sinatra
  class Base

    # Sinatra URL helpers.
    module Url
      #--
      # TODO: Encoding.
      def relative_url *path
        params = path[-1].respond_to?(:to_hash) ? path.delete_at(-1).to_hash : {}
        params = params.empty? ? '' : '?' + URI.escape(params.map{|*a| a.join('=')}.join('&')).to_s
        '/' + path.compact.map(&:to_s).join('/') + params
      end

      alias url_for relative_url

      def absolute_url *path
        port = request.port == 80 ? '' : ":#{request.port}"
        request.scheme + '://' + request.host + port + relative_url(*path)
      end
    end

    helpers Url
  end
end
