class User < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :events_attended, through: :EventAttendance, source: :attendee
end
