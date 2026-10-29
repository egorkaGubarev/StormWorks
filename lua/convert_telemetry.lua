function onTick()
    pitch = input.getNumber(1)
    altitude = input.getNumber(2)

    pitch = pitch * 360
    depth = -altitude

    output.setNumber(1, pitch)
    output.setNumber(2, depth)
end