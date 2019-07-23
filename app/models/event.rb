class Event < ApplicationRecord
    belongs_to :creator, foreign_key: "user_id", class_name: "User"
    has_many :event_attendances, foreign_key: "attended_event", class_name: "EventAttendance"
    has_many :attendees, through: :event_attendances, source: :attendant
    validates :event_title,  presence: true, length: { minimum: 5 }
    validates :date,  presence: true

    scope :past, -> { where("date < ?", DateTime.now) }
    scope :future, -> { where("date > ?", DateTime.now) }

end
