require 'rails_helper'

RSpec.describe "exercises/new", type: :view do
  before(:each) do
    assign(:exercise, Exercise.new())
  end

  it "renders new exercise form" do
    render

    assert_select "form[action=?][method=?]", exercises_path, "post" do
    end
  end
end
