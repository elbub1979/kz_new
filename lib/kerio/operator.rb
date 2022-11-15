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

        phones = operator.Extensions.get(query: { domainId: Rails.application.credentials.company.domain,
                                             direction: { columnName: 'USERNAME', orderBy: 'ASC' } })
        users = operator.Users.get(query: { domainId: Rails.application.credentials.company.domain,
                                            direction: { columnName: 'USERNAME', orderBy: 'ASC' } })

        data = users.instance_variable_get(:@resp).parsed_response['result']['userList']

        contacts = data.map do |user|
          next if user['EXTENSIONS'].empty?

          number = user['EXTENSIONS'][0]['TEL_NUM']
          username = user['USERNAME']
          email = user['EMAIL']
          name = user['FULL_NAME'].split(' ')
          { username: username, email: email, fname: name[1], pname: name[2], lname: name[0], number: number }
        end

        operator.Session.logout

        contacts.compact
      end
    end
  end
end
