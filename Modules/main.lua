local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 1. TẠO CỬA SỔ
local Window = OrionLib:MakeWindow({Name = "My BSS Hub", HidePremium = false, SaveConfig = false, ConfigFolder = "BSS_Test"})

local MiscTab = Window:MakeTab({
	Name = "Misc / Codes",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- 2. TẢI MODULE TỪ GITHUB VỀ (QUAN TRỌNG)
-- Lưu ý: Link phải là link RAW từ GitHub của bạn
local LinkModule = "https://raw.githubusercontent.com/Luanbets/BSS/refs/heads/main/Modules/nhapcode.lua"

-- Sử dụng pcall để bắt lỗi nếu link sai hoặc mạng lag
local success, CodeModule = pcall(function()
    return loadstring(game:HttpGet(LinkModule))()
end)

if not success then
    warn("Lỗi tải module: " .. tostring(CodeModule))
    OrionLib:MakeNotification({Name = "Lỗi!", Content = "Không tải được Module Nhập Code!", Time = 5})
end

-- 3. TẠO NÚT BẤM GỌI HÀM
MiscTab:AddButton({
	Name = "Nhập Tất Cả Code",
	Callback = function()
        if CodeModule and CodeModule.RedeemAll then
            -- Gọi hàm RedeemAll() nằm trong cái module đã tải về
            OrionLib:MakeNotification({Name = "Đang chạy...", Content = "Hệ thống đang nhập code...", Time = 3})
            
            CodeModule.RedeemAll() -- <--- CHỖ NÀY NÓ GỌI HÀM TRONG FILE NHAPCODE.LUA
            
            OrionLib:MakeNotification({Name = "Thành công", Content = "Đã chạy xong!", Time = 5})
        else
            OrionLib:MakeNotification({Name = "Lỗi", Content = "Module chưa được tải hoặc lỗi code!", Time = 5})
        end
  	end    
})

OrionLib:Init()
