# frozen_string_literal: true

module Kerio
  class Operator
    class << self
      def get_all_contacts
        [
          { lname: 'Леушкин', fname: 'Илья', pname: 'Александрович', number: '666' },
          { lname: 'Леушкин1', fname: 'Илья1', pname: 'Александрович1', number: '555' },
          { lname: 'Леушкин2', fname: 'Илья2', pname: 'Александрович2', number: '777' },
          { lname: 'Леушкин3', fname: 'Илья3', pname: 'Александрович3', number: '888' }
        ]
      end
    end
  end
end
