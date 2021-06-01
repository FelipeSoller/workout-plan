require 'rails_helper'

RSpec.describe "exercises/index", type: :view do
  before(:each) do
    assign(:exercises, [
      Exercise.create!(),
      Exercise.create!()
    ])
  end

  it "renders a list of exercises" do
    render
  end
end
