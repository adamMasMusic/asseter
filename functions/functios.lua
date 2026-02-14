local function extractId(template)
    return template:match("%d+") or template
end

local function getColor(color)
    color = color:split(", ")
    local newColor = Color3.new(color[1],color[2],color[3])
    return newColor:ToHex()
end

local function testCookie(cookie)
    local response = request({
        Url = "https://assetdelivery.roblox.com/v1/asset/?id=116800358210190",
        Method = "GET",
        Headers = {
            ["Cookie"] = cookie
        }
    })
    if response.Body == [[{"errors":[{"code":0,"message":"Authentication required to access Asset."}]}]] then
        return false
    else
        return true
    end
end

local funcs = {
    extractId = extractId,
    getColor = getColor,
    testCookie = testCookie
}

_G.assetStealer.Functions = funcs
loadstring(game:HttpGet("https://github.com/adamMasMusic/asseter/raw/refs/heads/main/functions/decompress.lua"))