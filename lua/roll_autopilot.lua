p = 0.02
standart_trim = 0

function onTick()
    on = input.getBool(1)

    target = input.getNumber(1)
    current = input.getNumber(2)

    trim = standart_trim

    if on then
        trim = (target - current * 360) * p
    end

    output.setNumber(1, trim)
end