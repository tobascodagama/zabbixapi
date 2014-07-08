class ZabbixApi
  class Configuration < Basic
    def array_flag
      false
    end

    def method_name
      'configuration'
    end

    def indentify
      'source'
    end

    def default_options
      # assume XML data unless otherwise specified
      # create template if it does not exist yet
      {format: 'xml', rules: {createMissing: true}}
    end

    def import(data)
      log "[DEBUG] Call import with parameters: #{data.inspect}"

      data_with_default = default_options.empty? ? data : merge_params(default_options, data)
      data_create = array_flag ? [data_with_default] : data_with_default
      result = @client.api_request(method: "#{method_name}.import", params: data_create)
      parse_keys result
    end

	def export(data)
		raise NotImplementedError
	end
  end
end
