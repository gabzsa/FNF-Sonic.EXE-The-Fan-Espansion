function onCreate()
    makeLuaText("MemoryCounter", "Memory Usage: 0 MB", 0, 0, 30)
    setTextSize("MemoryCounter", 15)
    setTextBorder("MemoryCounter", 3, "000000")
    addLuaText("MemoryCounter")
    setObjectCamera('MemoryCounter', 'other', true);
end

function onUpdate()
    local totalMemory = getPropertyFromClass("openfl.system.System", "totalMemory")
    local memory = math.abs(roundDecimal(totalMemory / 1000000, 1))

    setTextString("MemoryCounter", "Memory: " .. memory .. " MB")
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