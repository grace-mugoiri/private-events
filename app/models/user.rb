class User < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :event_attendances, foreign_key: "attendee", class_name: "EventAttendance"
    has_many :events_attended, through: :event_attendances, source: :event
end
