require 'zabbixapi'


def zbx
  # settings
  @api_url = ENV['ZABBIX_HOST_URL'] || 'http://10.211.55.6/api_jsonrpc.php'
  @api_login = 'Admin'
  @api_password = 'zabbix'

  @zbx ||= ZabbixApi.connect(
    :url => @api_url,
    :user => @api_login,
    :password => @api_password,
    :debug => false
  )
end

def gen_name(prefix)
  suffix = rand(1_000_000_000)
  "#{prefix}_#{suffix}"
end
