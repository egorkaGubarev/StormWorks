gun_offset = 3.5

function onTick()

    if input.getBool(1) then
        look_azim = input.getNumber(1)
        look_pitch = input.getNumber(2)

        distance = math.max(input.getNumber(3), gun_offset)

        output.setNumber(1, 4 * (look_azim + math.asin(gun_offset * math.sin(look_azim * 2 * math.pi) / distance) / (2 * math.pi)))
        output.setNumber(2, 4 * (look_pitch + math.asin(gun_offset * math.sin(look_pitch * 2 * math.pi) / distance) / (2 * math.pi)))
    else
        output.setNumber(1, 0)
        output.setNumber(2, 0)
    end
end