require 'spec_helper'

describe "appointments/show.html.erb" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment))
  end

  it "renders attributes in <p>" do
    render
  end
end
