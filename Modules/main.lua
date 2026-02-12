local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "My BSS Hub", 
    HidePremium = false, 
    SaveConfig = false, 
    ConfigFolder = "BSS_Test"
})

local MiscTab = Window:MakeTab({
    Name = "Misc / Codes",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- ============================================
-- LOAD MODULE TỪ GITHUB
-- ============================================
local CodeModule = nil

-- Thử load module
spawn(function()
    local success, result = pcall(function()
        -- Link RAW của file nhapcode.lua trên GitHub của bạn
        local link = "https://raw.githubusercontent.com/Luanbets/BSS/main/Modules/nhapcode.lua"
        return loadstring(game:HttpGet(link))()
    end)
    
    if success then
        CodeModule = result
        print("✓ Module loaded thành công!")
        OrionLib:MakeNotification({
            Name = "Thành công!", 
            Content = "Module đã sẵn sàng!", 
            Time = 3
        })
    else
        warn("✗ Lỗi load module: " .. tostring(result))
        OrionLib:MakeNotification({
            Name = "Lỗi!", 
            Content = "Không load được module!", 
            Time = 5
        })
    end
end)

-- NÚT BẤM
MiscTab:AddButton({
    Name = "Nhập Tất Cả Code",
    Callback = function()
        if CodeModule and CodeModule.RedeemAll then
            OrionLib:MakeNotification({
                Name = "Đang chạy...", 
                Content = "Hệ thống đang nhập code...", 
                Time = 3
            })
            
            CodeModule.RedeemAll()
            
            OrionLib:MakeNotification({
                Name = "Thành công!", 
                Content = "Đã nhập xong tất cả code!", 
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Lỗi!", 
                Content = "Module chưa load! Hãy đợi vài giây.", 
                Time = 5
            })
        end
    end    
})

OrionLib:Init()
