function onTick()
    control_right = input.getBool(1)
    fire = input.getBool(2)

    if control_right then
        fire_left = false
        fire_right = fire
        telemetry_channel = 2
        video_channel = 1
    else
        fire_left = fire
        fire_right = false
        telemetry_channel = 1
        video_channel = 0
    end

    output.setBool(1, fire_left)
    output.setBool(2, fire_right)
    output.setNumber(1, telemetry_channel)
    output.setNumber(2, video_channel)
end