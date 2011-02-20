require 'spec_helper'

describe "appointments/new.html.erb" do
  before(:each) do
    assign(:appointment, stub_model(Appointment).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appointments_path, :method => "post" do
    end
  end
end
