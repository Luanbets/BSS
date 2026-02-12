-- Danh sách Code
local codesList = {
    "Wax", "Roof", "Nectar", "Crawlers", "Connoisseur", 
    "Bopmaster", "38217", "ClubBean", "GumdropsForScience", "BeesBuzz123"
}

-- Hàm xử lý (Function)
local function RedeemAll()
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PromoCodeEvent")
    
    for i, code in ipairs(codesList) do
        -- Gửi lệnh nhập code
        remote:FireServer(code) 
        -- Nếu game bắt buộc dùng unpack table thì dùng dòng dưới:
        -- remote:FireServer(unpack({code})) 

        -- In ra console (F9) để kiểm tra ngầm
        print("Đang nhập code: " .. code)
        
        -- Chờ xíu để không bị kick
        task.wait(0.2)
    end
end
