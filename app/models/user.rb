class User < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :event_attendances, foreign_key: "attendee", class_name: "EventAttendance"
    has_many :events_attended, through: :event_attendances, source: :event


    def upcoming_events
        @future = []
        self.events_attended.each do |ev|
         @future << ev if ev.date > Time.now
        end
        @future
    end
    
    def past_events
        @past = []
        self.events_attended.each do |ev|
         @past << ev if ev.date <= Time.now
        end
        @past
    end
end
