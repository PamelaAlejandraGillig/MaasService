# frozen_string_literal: true

company = Company.create(name: 'Recorrido.cl')

Employee.create([
                  {
                    first_name: 'Ernesto',
                    last_name: 'Perez',
                    color: '#66CDAA'
                  },
                  {
                    first_name: 'Barbara',
                    last_name: 'Sanchez',
                    color: '#FFB6C1'
                  },
                  {
                    first_name: 'Benjamin',
                    last_name: 'Martinez',
                    color: '#6495ED'
                  }
                ])

contract = Contract.create(
  name: 'Monitoreo Recorrido.cl',
  start: DateTime.new(2022, 8, 22, 9),
  end: DateTime.new(2022, 12, 31, 15),
  duration: 874,
  company_id: company.id
)

Turn.create(
  week: 34,
  period: {
    1 => { start_at: 9,
           end_at: 18 },
    2 => { start_at: 9,
           end_at: 18 },
    3 => { start_at: 9,
           end_at: 18 },
    4 => { start_at: 9,
           end_at: 18 },
    5 => { start_at: 9,
           end_at: 18 },
    6 => { start_at: 9,
           end_at: 18 }
  },
  contract_id: contract.id
)
