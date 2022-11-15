module Kerio
  class Operator
    class << self
      def get_all_contacts
        operator = Kerio::Api::Client.new(url: URI.parse(Rails.application.credentials.kerio.operator.url),
                                          insecure: true)

        operator.Session.login(userName: Rails.application.credentials.kerio.operator.user,
                               password: Rails.application.credentials.kerio.operator.password,
                               application: { name: 'operator',
                                              vendor: 'Kerio',
                                              version: 'current' })

        phones = operator.Extensions.get(query: { domainId: Rails.application.credentials.company.domain })
        # users = operator.Users.get(query: { domainId: Rails.application.credentials.company.domain,
        #                                     direction: { columnName: 'USERNAME', orderBy: 'ASC' } })

        # data = phones.instance_variable_get(:@resp).parsed_response['result']['userList']
        data = phones.instance_variable_get(:@resp).parsed_response['result']['sipExtensionList']

        contacts = data.collect do |user|
          next if user.nil?

          username = user['USERNAME']
          email = user['EMAIL']
          number = user['telNum']
          name = user['FULL_NAME'].split(' ')
          { username: username, email: email, number: number, lname: name[0], fname: name[1], pname: name[2] }
        end

        operator.Session.logout

        contacts.compact
      end
    end
  end
end
