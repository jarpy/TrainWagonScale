-- Fetch the scaling factor from the mod settings.
local scale = settings.startup["balanced-longer-trains-scale-factor"].value
local friction_scale = scale

-- Constrain the amount that rolling friction gets scaled.
if scale > 2.0 then
    friction_scale = 2.0
elseif scale < 0.5 then
    friction_scale = 0.5
end

-- Scale the cargo wagons.
local cargo_wagon = data.raw['cargo-wagon']['cargo-wagon']
cargo_wagon.inventory_size = scale * cargo_wagon.inventory_size
cargo_wagon.weight         = scale * cargo_wagon.weight
cargo_wagon.braking_force  = scale * cargo_wagon.braking_force
cargo_wagon.friction_force = friction_scale * cargo_wagon.friction_force

-- Scale the fluid wagons.
local fluid_wagon = data.raw['fluid-wagon']['fluid-wagon']
fluid_wagon.capacity       = scale * fluid_wagon.capacity
fluid_wagon.weight         = scale * fluid_wagon.weight
fluid_wagon.braking_force  = scale * fluid_wagon.braking_force
fluid_wagon.friction_force = friction_scale * fluid_wagon.friction_force
