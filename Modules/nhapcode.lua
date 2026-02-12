local module = {} -- Tạo một cái bảng chứa chức năng

-- Hàm nhập code nằm trong bảng này
function module.RedeemAll()
    local codesList = {
        "Wax", "Roof", "Nectar", "Crawlers", "Connoisseur", 
        "Bopmaster", "38217", "ClubBean", "GumdropsForScience", "BeesBuzz123"
    }

    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PromoCodeEvent")
    
    -- Thông báo nhỏ (nếu muốn)
    print("Bắt đầu nhập code từ Module...")

    for i, code in ipairs(codesList) do
        remote:FireServer(code)
        task.wait(0.2)
    end
    
    print("Đã nhập xong!")
end

return module -- QUAN TRỌNG: Phải trả về cái bảng này để main.lua nhận được
