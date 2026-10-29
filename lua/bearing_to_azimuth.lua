function onTick()
    azimuth = input.getNumber(1) - input.getNumber(2)

    if azimuth < 0 then
        azimuth = 1 + azimuth
    end

    output.setNumber(1, azimuth * 360)
end