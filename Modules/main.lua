-- 1. Load Thư viện UI (Ví dụ dùng Orion Lib, hoặc thư viện bạn thích)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 2. Tạo Cửa sổ
local Window = OrionLib:MakeWindow({Name = "My Script Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "MyScriptConfig"})

-- 3. Load File Logic từ GitHub (Sử dụng link RAW từ file AutoCode.lua bạn tạo ở Bước 1)
-- Thay đường link bên dưới bằng link Raw file AutoCode.lua của bạn
local LogicUrl = "https://raw.githubusercontent.com/Luanbets/BSS/main/Modules/AutoCode.lua"local AutoCodeModule = loadstring(game:HttpGet(LogicUrl))()

-- 4. Tạo Tab và Các chức năng
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddSection({
	Name = "Tính năng chính"
})

-- 5. Tạo Nút gọi hàm từ Module
Tab:AddButton({
	Name = "Tự Động Nhập Code",
	Callback = function()
      	-- Gọi hàm RedeemAll được định nghĩa trong Module
        if AutoCodeModule then
            AutoCodeModule.RedeemAll()
        else
            warn("Không thể tải Module AutoCode!")
        end
  	end    
})

OrionLib:Init()
