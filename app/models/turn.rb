class Turn < ApplicationRecord
  belongs_to :contract

  def get_shifts
    @days = [{ period: contract.start }]
    period.each do |day, hours|
      @hours = []
      @days << { day: day, record: @hours }
      (hours['start_at']..hours['end_at']).each do |time|
        record = Registration
                 .where('extract(isodow from date_from) = ? AND extract(HOUR from date_from) = ? AND turn_id = ?',
                        day, time, id).first

        if record.present?
          hour = record.date_from.to_s(:time)
          @hours << { time: time, employee: record.employee.last_name } if hour.to_i == time
        else
          @hours << { time: time, employee: '' }
        end
      end
    end
    @days.to_json
  end
end
