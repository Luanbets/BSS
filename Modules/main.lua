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
-- CODE NHẬP TỰ ĐỘNG (NHÚNG TRỰC TIẾP)
-- ============================================
local function RedeemAllCodes()
    local codesList = {
        "Wax", "Roof", "Nectar", "Crawlers", "Connoisseur", 
        "Bopmaster", "38217", "ClubBean", "GumdropsForScience", "BeesBuzz123"
    }

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Events = ReplicatedStorage:WaitForChild("Events")
    local remote = Events:WaitForChild("PromoCodeEvent")
    
    print("Bắt đầu nhập code...")

    for i, code in ipairs(codesList) do
        local success, err = pcall(function()
            remote:FireServer(code)
        end)
        
        if success then
            print("✓ Nhập thành công: " .. code)
        else
            warn("✗ Lỗi code " .. code .. ": " .. tostring(err))
        end
        
        task.wait(0.3)
    end
    
    print("Hoàn tất!")
end

-- NÚT BẤM
MiscTab:AddButton({
    Name = "Nhập Tất Cả Code",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Đang chạy...", 
            Content = "Hệ thống đang nhập code...", 
            Time = 3
        })
        
        RedeemAllCodes()
        
        OrionLib:MakeNotification({
            Name = "Thành công!", 
            Content = "Đã nhập xong tất cả code!", 
            Time = 5
        })
    end    
})

OrionLib:Init()
