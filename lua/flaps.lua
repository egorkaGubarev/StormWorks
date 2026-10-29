angle = 20

function onTick()
    extend = input.getBool(1)

    position = 0

    if extend then
        position = angle / 45
    end

    output.setNumber(1, position)
end