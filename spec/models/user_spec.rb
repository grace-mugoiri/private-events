require 'rails_helper'

RSpec.describe User, type: :model do
  it "Is not validated when name is nill" do
    user = User.new(name:"")
    expect(user).not_to be_valid
  end
  it "Is not validated when name is only one letter" do
    user = User.new(name:"a")
    expect(user).not_to be_valid
  end

  it "Is validated when name is not nill" do
    user = User.new(name:"Cenk")
    expect(user).to be_valid
  end

  it "Is destroying related events along with the user" do
    user = User.new(name:"Cenk")
    user.save
    user.events << Event.new(event_title:"TestEvent", date: Time.now)
    expect { user.destroy }.to change { Event.count }.by(-1)
  end

  it "Runs the through relationship correctly" do
    user = User.new(name:"Cenk")
    user.save
    user.events << Event.new(event_title:"TestEvent", date: Time.now)
    expect { EventAttendance.create(attendee: user.id, attended_event:Event.first.id) }
                                        .to change { user.events_attended.count }.by(1)
  end
end
