require 'rails_helper'

RSpec.describe "exercises/show", type: :view do
  before(:each) do
    @exercise = assign(:exercise, Exercise.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
