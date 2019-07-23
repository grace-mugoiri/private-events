class AddIndexToEventAttendances < ActiveRecord::Migration[5.2]
  def change
    add_index :event_attendances, :attendee
    add_index :event_attendances, :attended_event
  end
end
