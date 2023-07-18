require "rails_helper"

RSpec.describe "Routes for Trip", type: :routing do
  let(:trip) { FactoryBot.create(:trip) }

  it "routes /trips to the index action of the Trips controller" do
    expect(get("/trips")).
      to route_to("trips#index")
  end

  it "routes /trips/:id to the show action of the Trips controller" do
    expect(get("/trips/#{trip.id}")).
      to route_to("trips#show", id: trip.id.to_s)
  end

  it "routes /trips/new to the new action of the Trips controller" do
    expect(get("/trips/new")).
      to route_to("trips#new")
  end

  it "routes /trips/:id/edit to the edit action of the Trips controller" do
    expect(get("/trips/#{trip.id}/edit")).
      to route_to("trips#edit", id: trip.id.to_s)
  end

  it "routes /trips to the create action of the Trips controller" do
    expect(post("/trips")).
      to route_to("trips#create")
  end

  it "routes /trips/:id to the update action of the Trips controller" do
    expect(put("/trips/#{trip.id}")).
      to route_to("trips#update", id: trip.id.to_s)
  end

  it "routes /trips/:id to the destroy action of the Trips controller" do
    expect(delete("/trips/#{trip.id}")).
      to route_to("trips#destroy", id: trip.id.to_s)
  end
end
