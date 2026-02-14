_G.assetStealer.functions.decompressGzip = function decompressGzip(data)
    local byte1, byte2, byte3, byte4 = data:byte(1, 4)
    if byte1 == 0x89 and byte2 == 0x50 and byte3 == 0x4E and byte4 == 0x47 then
        return data --roblox lied about decompression (this happens after the new fucking update)
    end

    if data:byte(1) ~= 0x1F or data:byte(2) ~= 0x8B then
        return nil, "Not GZIP format"
    end
    
    local flags = data:byte(4)
    local pos = 11
    
    if bit32.band(flags, 0x04) ~= 0 then
        local xlen = data:byte(pos) + data:byte(pos + 1) * 256
        pos = pos + 2 + xlen
    end
    
    if bit32.band(flags, 0x08) ~= 0 then
        while data:byte(pos) ~= 0 do pos = pos + 1 end
        pos = pos + 1
    end
    
    if bit32.band(flags, 0x10) ~= 0 then
        while data:byte(pos) ~= 0 do pos = pos + 1 end
        pos = pos + 1
    end
    
    if bit32.band(flags, 0x02) ~= 0 then
        pos = pos + 2
    end
    
    local deflateData = data:sub(pos, #data - 8)
    
    local success, result = pcall(function()
        return LibDeflate.Deflate.Decompress(deflateData)
    end)
    
    if success and result then
        return result
    else
        return nil, "Decompression failed: " .. tostring(result)
    end
end