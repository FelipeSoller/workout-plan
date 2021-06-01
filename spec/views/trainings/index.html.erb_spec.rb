require 'rails_helper'

RSpec.describe "trainings/index", type: :view do
  before(:each) do
    assign(:trainings, [
      Training.create!(),
      Training.create!()
    ])
  end

  it "renders a list of trainings" do
    render
  end
end
