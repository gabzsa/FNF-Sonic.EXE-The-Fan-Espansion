function onCreate()
    makeLuaText("Contador de Memoria", "Memoria usada: 0 MB", 0, 0, 30)
    setTextSize("Contador de Memoria", 15)
    setTextBorder("Contador de Memoria", 3, "000000")
    addLuaText("Contador de Memoria")
    setObjectCamera('MemoryCounter', 'other', true);
end

function onUpdate()
    local totalMemory = getPropertyFromClass("openfl.system.System", "totalMemory")
    local memory = math.abs(roundDecimal(totalMemory / 1000000, 1))

    setTextString("Contador de Memoria", "Memoria: " .. memory .. " MB")
end

function roundDecimal(value, precision)
    local mult = 1

    for i = 0, precision do
        mult = mult * 10
    end

    return fround(value * mult, -1) / mult
end

function fround(number, decimals)
    local power = 10 ^ decimals
    return math.floor(number * power) / power
end