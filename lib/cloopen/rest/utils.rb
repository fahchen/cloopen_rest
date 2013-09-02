module Cloopen
  module REST
    module Utils

      def build_body(something, resource)
        builder = Builder::XmlMarkup.new
        builder.instruct! :xml, version: '1.0', encoding: 'UTF-8'

        builder.tag! resource.instance_key.chop do |resource|
          something.each do |k, v|
            attr = downcase_first cloopfy(k)
            resource.tag! attr, v
          end
          resource.appId @app_id
        end
      end

      def prase_body(something)
        if something.is_a? Hash
          beautify_hash something
        else
          something
        end
      end

      def beautify_hash(hash)
        hash = decloopfy hash
        hash.each do |k, v|
          hash[k] = if v.is_a? Hash
            beautify_hash v
          else
            v
          end
        end
      end


      def downcase_first(something)
        [something[0, 1].downcase, something[1..-1]].join('')
      end

      def cloopfy(something)
        if something.is_a? Hash
          Hash[*something.to_a.map {|a| [cloopfy(a[0]).to_sym, a[1]]}.flatten]
        else
          something.to_s.split('_').map do |s|
            [s[0,1].capitalize, s[1..-1]].join
          end.join
        end
      end

      def decloopfy(something)
        if something.is_a? Hash
          Hash[*something.to_a.map {|pair| [decloopfy(pair[0]).to_sym, pair[1]]}.flatten]
        else
          something.to_s.gsub(/[A-Z][a-z]*/) {|s| "_#{s.downcase}"}.gsub(/^_/, '')
        end
      end

    end
  end
end
