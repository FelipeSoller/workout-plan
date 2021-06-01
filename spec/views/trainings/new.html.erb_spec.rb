require 'rails_helper'

RSpec.describe "trainings/new", type: :view do
  before(:each) do
    assign(:training, Training.new())
  end

  it "renders new training form" do
    render

    assert_select "form[action=?][method=?]", trainings_path, "post" do
    end
  end
end
