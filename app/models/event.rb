class Event < ApplicationRecord
    belongs_to :creator, foreign_key: "user_id", class_name: "User"
    has_many :people_attended, through: :EventAttendance, source: :attendee
end
