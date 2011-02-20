require 'spec_helper'

describe "appointments/index.html.erb" do
  before(:each) do
    assign(:appointments, [
      stub_model(Appointment),
      stub_model(Appointment)
    ])
  end

  it "renders a list of appointments" do
    render
  end
end
