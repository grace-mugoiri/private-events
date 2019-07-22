class EventAttendance < ApplicationRecord
    belongs_to :attendant, foreign_key: "attendee", class_name: "User"
    belongs_to :event, foreign_key: "attended_event", class_name: "Event"
end
