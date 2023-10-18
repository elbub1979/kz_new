require 'net-ldap'

class ActiveDirectory
  include ActiveModel::Model

  def initialize(args)
    @type = args[:type]
    @host = Rails.application.credentials.active_directory.host
    @port = Rails.application.credentials.active_directory.port
    @dc1 = Rails.application.credentials.active_directory.dc1
    @dc2 = Rails.application.credentials.active_directory.dc2
    @ou = Rails.application.credentials.active_directory.ou
    @admin_login = Rails.application.credentials.active_directory.admin_login
    @admin_password = Rails.application.credentials.active_directory.admin_password
  end

  def read
    ldap = Net::LDAP.new(host: @host, port: @port)
    treebase = "OU=#{@type}, OU=#{@ou}, DC=#{@dc2}, DC=#{@dc1}"

    ldap.auth @admin_login, @admin_password

    ldap.search(base: treebase).map do |entry|
      {
        name: entry['name'][0].to_s,
        mail: entry['mail'][0].to_s
      }
    end

  end
end

# puts @ldap.bind ? true : false

# @filter = ~ Net::LDAP::Filter.eq('CN', 'ExchangeActiveSyncDevices') & Net::LDAP::Filter.eq('CN', '*')
# @filter = ~ Net::LDAP::Filter.eq('CN', 'ExchangeActiveSyncDevices')
# @filter = ~ Net::LDAP::Filter.eq('objectClass', 'ExchangeActiveSyncDevices')
# @filter = Net::LDAP::Filter.eq('CN', '*')

#:objectclass
# CN=ExchangeActiveSyncDevices,CN=Мартынов Павел Сергеевич,OU=USERS,OU=REDSTAR,DC=redstar,DC=ru

# @ldap.search(base: @treebase)[20].each { |key, value| p "#{key}: #{value}" }

# puts @ldap.search(base: @treebase)[20]['name']

# @groups = @ldap.search(bse: @treebase).map do |group|
# name = group['name'].first.to_s
# Group.new(name: name)
# end

# @ldap.search(base: @treebase) do |entry|
  # p "DN: #{entry.dn}"
# end

# p @ldap.search(base: @treebase)[1]
