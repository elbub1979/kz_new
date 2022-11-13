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

        users = operator.Users.get(query: { domainId: Rails.application.credentials.company.domain,
                                            direction: { columnName: 'USERNAME', orderBy: 'ASC' } })

        data = users.instance_variable_get(:@resp).parsed_response['result']['userList']

        contacts = data.map do |user|
          unless user['EXTENSIONS'].empty?
            name = user['FULL_NAME'].split(' ')
            { number: user['EXTENSIONS'][0]['TEL_NUM'], fname: name[1], pname: name[2], lname: name[0] }
          end
        end

        operator.Session.logout

        contacts.compact
      end
    end
  end
end
