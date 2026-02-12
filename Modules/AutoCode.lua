local module = {}

function module.RedeemAll()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local remote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("PromoCodeEvent")

    -- Danh sách Code (Bạn có thể cập nhật list này trên GitHub dễ dàng về sau)
    local codesList = {
        "Wax", "Roof", "Nectar", "Crawlers", "Connoisseur", 
        "Bopmaster", "38217", "ClubBean", "GumdropsForScience", "BeesBuzz123"
    }

    print("=== BẮT ĐẦU NHẬP CODE ===")
    
    -- Gửi thông báo nhỏ (nếu có thư viện UI) hoặc in ra console
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Auto Code";
        Text = "Đang bắt đầu nhập code...";
        Duration = 3;
    })

    for i, code in ipairs(codesList) do
        -- Kiểm tra nhân vật còn sống hoặc kết nối trước khi fire (tuỳ chọn)
        print("Đang nhập: " .. code)
        remote:FireServer(code)
        task.wait(0.8) -- Delay an toàn
    end

    print("=== HOÀN TẤT! ===")
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Auto Code";
        Text = "Đã nhập xong tất cả code!";
        Duration = 5;
    })
end

return module
