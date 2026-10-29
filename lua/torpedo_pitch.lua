pitch_p = 60
depth_p = 0.01
roll_p = 4
max_pitch = 0.1
ascent_distance = 200

function onTick()
    pitch = input.getNumber(1)
    roll = input.getNumber(2)
    altitude = input.getNumber(3)
    input_depth = input.getNumber(4)
    distance = input.getNumber(5)

    roll_correction = math.min(0.5, math.max(-0.5, roll * roll_p))
    
    if distance > ascent_distance then
        target_altitude = -input_depth
    else
        target_altitude = -distance * input_depth / ascent_distance
    end

    target_pitch = math.min(max_pitch, math.max(-max_pitch, (target_altitude - altitude) * depth_p))
    pitch_correction = math.min(0.5, math.max(-0.5, (target_pitch - pitch) * pitch_p))

    output.setNumber(1, pitch_correction - roll_correction)
    output.setNumber(2, pitch_correction + roll_correction)
end