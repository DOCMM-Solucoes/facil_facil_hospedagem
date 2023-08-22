require "rails_helper"

RSpec.describe 'Routes for Room', type: :routing do
  let(:room) { FactoryBot.create(:room) }


  it 'Routes /rooms to the index action of the Rooms controller', skip: true do
    expect(get('/locale/rooms')).
      to route_to("rooms#index")
  end

  it 'Routes /rooms/:id to the show action of the Rooms controller', skip: true do
    expect(get("/locale/rooms/#{room.id}")).
      to route_to("rooms#show", id: room.id.to_s)
  end

  it 'Routes /rooms/new to the new action of the Rooms controller', skip: true do
    expect(get("/locale/rooms/new")).
      to route_to("rooms#new")
  end

  it 'Routes /rooms/:id/edit to the edit action of the Rooms controller', skip: true do
    expect(get("/locale/rooms/#{room.id}/edit")).
      to route_to("rooms#edit", id: room.id.to_s)
  end

  it 'Routes /rooms to the create action of the Rooms controller', skip: true do
    expect(post("/locale/rooms")).
      to route_to("rooms#create")
  end

  it 'Routes /rooms/:id to the update action of the Rooms controller', skip: true do
    expect(put("/locale/rooms/#{room.id}")).
      to route_to("rooms#update", id: room.id.to_s)
  end

  it 'Routes /rooms/:id to the destroy action of the Rooms controller', skip: true do
    expect(delete("/locale/rooms/#{room.id}")).
      to route_to("rooms#destroy", id: room.id.to_s)
  end
end
