function onTick()
	x = input.getNumber(1)
    y = input.getNumber(2)

    target_x = input.getNumber(3)
    target_y = input.getNumber(4)

    dx = target_x - x
    dy = target_y - y

    distance = (dx ^ 2 + dy ^ 2) ^ 0.5
    azimuth = 90 - math.atan(dy / dx) * 180 / math.pi

    if dx < 0 then
        azimuth = azimuth + 180
    end

    output.setNumber(1, azimuth)
	output.setNumber(2, distance / 1000)
end