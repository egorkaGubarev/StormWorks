launched = false
max_throttle = 0.1
throttle = 0

function onTick()
    if input.getBool(1) then
        launched = true
    end

    if launched then
        throttle = max_throttle
    end
    
    output.setNumber(1, throttle)
end