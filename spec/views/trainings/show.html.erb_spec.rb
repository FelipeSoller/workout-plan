require 'rails_helper'

RSpec.describe "trainings/show", type: :view do
  before(:each) do
    @training = assign(:training, Training.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
