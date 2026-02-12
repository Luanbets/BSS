local module = {} -- 1. Tạo cái vỏ hộp

-- 2. Định nghĩa hàm nằm TRONG cái hộp đó
function module.RedeemAll()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    -- Kiểm tra xem Event có tồn tại không để tránh lỗi
    local eventFolder = ReplicatedStorage:WaitForChild("Events", 5)
    local remote = eventFolder and eventFolder:WaitForChild("PromoCodeEvent", 5)

    if not remote then
        warn("Không tìm thấy PromoCodeEvent!")
        return
    end

    local codesList = {
        "Wax", "Roof", "Nectar", "Crawlers", "Connoisseur", 
        "Bopmaster", "38217", "ClubBean", "GumdropsForScience", "BeesBuzz123"
    }

    -- Thông báo bắt đầu
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Auto Code";
        Text = "Bắt đầu nhập...";
        Duration = 3;
    })

    for i, code in ipairs(codesList) do
        remote:FireServer(code)
        task.wait(0.8)
    end

    -- Thông báo xong
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Auto Code";
        Text = "Đã nhập xong!";
        Duration = 5;
    })
end

return module -- 3. QUAN TRỌNG: Phải trả cái hộp ra ngoài
