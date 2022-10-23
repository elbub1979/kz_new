# frozen_string_literal: true

module Kerio
  class KerioOperator
    class << self
      def get_all_contacts
        [
          { fname: 'Илья', lname: 'Леушкин', pname: 'Александрович', number: '555' },
          { fname: 'Илья1', lname: 'Леушкин1', pname: 'Александрович1', number: '666' }
        ]
      end
    end
  end
end
