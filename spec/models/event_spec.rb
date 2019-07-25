require 'rails_helper'

RSpec.describe Event, type: :model do
  
    it "Is not validated when title is nil" do
      user = User.create(name: "Cenk")
      event = user.events.build(event_title:"", date: Time.now)
      expect(event).not_to be_valid
    end
  
    it "checks the association with user, dependent: :destroy" do
      user = User.create(name: "Cenk")
      user.events.build(event_title:"Meeting", date: Time.now)
      event = user.events.first
      event.save
      expect { user.destroy }.to change { Event.count }.by(-1)
    end
  
    it "checks relationship with the through table" do
      user = User.create(name: "Yemre")
      user2 = User.create(name: "Grace")
      user.events.build(event_title:"Meeting", date: Time.now)
      event = user.events.first
      event.save
      user2.events_attended << event
      expect( EventAttendance.count ).to be(1)
    end
end
