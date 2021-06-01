require 'rails_helper'

RSpec.describe "trainings/edit", type: :view do
  before(:each) do
    @training = assign(:training, Training.create!())
  end

  it "renders the edit training form" do
    render

    assert_select "form[action=?][method=?]", training_path(@training), "post" do
    end
  end
end
