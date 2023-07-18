require "rails_helper"

RSpec.describe "Routes for Guide", type: :routing do
  let(:guide) { FactoryBot.create(:guide) }

  it "routes /guides to the index action of the Guides controller" do
    expect(get("/guides")).
      to route_to("guides#index")
  end

  it "routes /guides/:id to the show action of the Guides controller" do
    expect(get("/guides/#{guide.id}")).
      to route_to("guides#show", id: guide.id.to_s)
  end

  it "routes /guides/new to the new action of the Guides controller" do
    expect(get("/guides/new")).
      to route_to("guides#new")
  end

  it "routes /guides/:id/edit to the edit action of the Guides controller" do
    expect(get("/guides/#{guide.id}/edit")).
      to route_to("guides#edit", id: guide.id.to_s)
  end

  it "routes /guides to the create action of the Guides controller" do
    expect(post("/guides")).
      to route_to("guides#create")
  end

  it "routes /guides/:id to the update action of the Guides controller" do
    expect(put("/guides/#{guide.id}")).
      to route_to("guides#update", id: guide.id.to_s)
  end

  it "routes /guides/:id to the destroy action of the Guides controller" do
    expect(delete("/guides/#{guide.id}")).
      to route_to("guides#destroy", id: guide.id.to_s)
  end
end
