# frozen_string_literal: true

company = Company.create(name: 'Recorrido.cl')

User.create([
                  {
                    email: 'ernesto@gmail.com',
                    full_name: 'Ernesto P.',
                    color: '#66CDAA',
                    password_digest: '$2a$12$uhWNpyI8I04hDldW6iPOXuT6KmxOc2Ojk1Kuw5GQ5rvIZEzNGrQ/.'
                  },
                  {
                    email: 'barbara@gmail.com',
                    full_name: 'Barbara s.',
                    color: '#FFB6C1',
                    password_digest: '$2a$12$uhWNpyI8I04hDldW6iPOXuT6KmxOc2Ojk1Kuw5GQ5rvIZEzNGrQ/.'
                  },
                  {
                    email: 'benjamin@gmail.com',
                    full_name: 'Benjamin j.',
                    color: '#6495ED',
                    password_digest: '$2a$12$uhWNpyI8I04hDldW6iPOXuT6KmxOc2Ojk1Kuw5GQ5rvIZEzNGrQ/.'
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
