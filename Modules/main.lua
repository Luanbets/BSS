local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 1. TẠO MENU
local Window = OrionLib:MakeWindow({Name = "My BSS Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "BSS_Config"})

local MiscTab = Window:MakeTab({
	Name = "Misc / Codes",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- 2. LOAD MODULE TỪ GITHUB (QUAN TRỌNG)
-- Loadstring sẽ tải code về và chạy, kết quả trả về chính là cái "module" table ở Bước 1
local CodeModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Luanbets/BSS/refs/heads/main/Modules/nhapcode.lua"))()

-- Kiểm tra xem tải được chưa (Optional)
if not CodeModule then
    OrionLib:MakeNotification({Name = "Lỗi!", Content = "Không tải được Module Code!", Time = 5})
    return
end

-- 3. TẠO NÚT BẤM KẾT NỐI VỚI MODULE
MiscTab:AddButton({
	Name = "Nhập Tất Cả Code",
	Callback = function()
        -- Gọi hàm RedeemAll() nằm trong cái module đã tải về
        OrionLib:MakeNotification({Name = "Đang chạy...", Content = "Vui lòng đợi...", Time = 3})
        
        CodeModule.RedeemAll() -- <--- CHỖ NÀY NÓ GỌI CODE TỪ LINK GITHUB
        
        OrionLib:MakeNotification({Name = "Thành công", Content = "Đã chạy xong script nhập code!", Time = 5})
  	end    
})

OrionLib:Init()
