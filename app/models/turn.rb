# frozen_string_literal: true

class Turn < ApplicationRecord
  belongs_to :contract
  validates :period, presence: true
  validates :week, presence: true

  def get_shifts
    @days = [{ period: contract.start, name: contract.name, week: week, id: id }]
    period.each do |day, hours|
      @hours = []
      @days << { day: day, record: @hours }
      (hours['start_at']..hours['end_at']).each do |time|
        record = Registration
                 .where('extract(isodow from date_from) = ? AND extract(HOUR from date_from) = ? AND turn_id = ?',
                        day, time, id).first

        if record.present?
          hour = record.date_from.to_s(:time)
          @hours << { time: time, user: record.user.full_name, color: record.user.color } if hour.to_i == time
        else
          @hours << { time: time, user: '', color: '' }
        end
      end
    end
    @days.to_json
  end
end
