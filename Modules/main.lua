local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

print("========================================")
print("🔧 DEBUG MODE - BẮT ĐẦU KHỞI ĐỘNG")
print("========================================")

local Window = OrionLib:MakeWindow({
    Name = "My BSS Hub [DEBUG]", 
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
-- DEBUG: KIỂM TRA MÔI TRƯỜNG
-- ============================================
print("[DEBUG] Kiểm tra ReplicatedStorage...")
local RS = game:GetService("ReplicatedStorage")
print("[DEBUG] ReplicatedStorage:", RS)

local Events = RS:FindFirstChild("Events")
if Events then
    print("[DEBUG] ✓ Events tồn tại!")
    local PromoCodeEvent = Events:FindFirstChild("PromoCodeEvent")
    if PromoCodeEvent then
        print("[DEBUG] ✓ PromoCodeEvent tồn tại!")
    else
        warn("[DEBUG] ✗ KHÔNG TÌM THẤY PromoCodeEvent!")
    end
else
    warn("[DEBUG] ✗ KHÔNG TÌM THẤY Events!")
end

-- ============================================
-- DEBUG: LOAD MODULE TỪ GITHUB
-- ============================================
local CodeModule = nil
local LinkModule = "https://raw.githubusercontent.com/Luanbets/BSS/main/Modules/nhapcode.lua"

print("[DEBUG] Link module:", LinkModule)
print("[DEBUG] Đang thử tải module...")

spawn(function()
    -- BƯỚC 1: Kiểm tra HTTP GET
    print("[DEBUG] BƯỚC 1: Gọi HttpGet...")
    local step1_success, step1_result = pcall(function()
        return game:HttpGet(LinkModule)
    end)
    
    if not step1_success then
        warn("[DEBUG] ✗ LỖI HttpGet:", step1_result)
        OrionLib:MakeNotification({
            Name = "Lỗi HTTP!", 
            Content = "Không thể tải từ GitHub!", 
            Time = 10
        })
        return
    end
    
    print("[DEBUG] ✓ HttpGet thành công!")
    print("[DEBUG] Độ dài dữ liệu nhận được:", #step1_result, "ký tự")
    print("[DEBUG] 100 ký tự đầu tiên:", string.sub(step1_result, 1, 100))
    
    -- BƯỚC 2: Kiểm tra xem có phải HTML không
    if string.find(step1_result, "<!DOCTYPE html>") or string.find(step1_result, "<html") then
        warn("[DEBUG] ✗ NHẬN ĐƯỢC HTML THAY VÌ LUA CODE!")
        warn("[DEBUG] Link có thể sai hoặc file không tồn tại!")
        OrionLib:MakeNotification({
            Name = "Lỗi!", 
            Content = "Link GitHub trả về HTML, không phải code!", 
            Time = 10
        })
        return
    end
    
    print("[DEBUG] ✓ Không phải HTML!")
    
    -- BƯỚC 3: Thử loadstring
    print("[DEBUG] BƯỚC 2: Thử loadstring...")
    local step2_success, step2_result = pcall(function()
        return loadstring(step1_result)
    end)
    
    if not step2_success then
        warn("[DEBUG] ✗ LỖI loadstring:", step2_result)
        OrionLib:MakeNotification({
            Name = "Lỗi Compile!", 
            Content = "Code Lua có lỗi cú pháp!", 
            Time = 10
        })
        return
    end
    
    if not step2_result then
        warn("[DEBUG] ✗ loadstring trả về nil!")
        OrionLib:MakeNotification({
            Name = "Lỗi!", 
            Content = "loadstring thất bại!", 
            Time = 10
        })
        return
    end
    
    print("[DEBUG] ✓ loadstring thành công!")
    
    -- BƯỚC 4: Thử chạy module
    print("[DEBUG] BƯỚC 3: Chạy module...")
    local step3_success, step3_result = pcall(step2_result)
    
    if not step3_success then
        warn("[DEBUG] ✗ LỖI chạy module:", step3_result)
        OrionLib:MakeNotification({
            Name = "Lỗi Runtime!", 
            Content = "Module bị lỗi khi chạy!", 
            Time = 10
        })
        return
    end
    
    print("[DEBUG] ✓ Module chạy thành công!")
    print("[DEBUG] Kiểu dữ liệu module:", type(step3_result))
    
    -- BƯỚC 5: Kiểm tra hàm RedeemAll
    if type(step3_result) ~= "table" then
        warn("[DEBUG] ✗ Module không phải là table!")
        OrionLib:MakeNotification({
            Name = "Lỗi!", 
            Content = "Module không đúng định dạng!", 
            Time = 10
        })
        return
    end
    
    print("[DEBUG] ✓ Module là table!")
    
    if not step3_result.RedeemAll then
        warn("[DEBUG] ✗ Không tìm thấy hàm RedeemAll trong module!")
        print("[DEBUG] Các key trong module:")
        for k, v in pairs(step3_result) do
            print("  -", k, ":", type(v))
        end
        OrionLib:MakeNotification({
            Name = "Lỗi!", 
            Content = "Không có hàm RedeemAll!", 
            Time = 10
        })
        return
    end
    
    print("[DEBUG] ✓ Tìm thấy hàm RedeemAll!")
    print("[DEBUG] Kiểu dữ liệu RedeemAll:", type(step3_result.RedeemAll))
    
    CodeModule = step3_result
    print("[DEBUG] ========================================")
    print("[DEBUG] 🎉 MODULE LOAD THÀNH CÔNG HOÀN TOÀN!")
    print("[DEBUG] ========================================")
    
    OrionLib:MakeNotification({
        Name = "Thành công!", 
        Content = "Module đã sẵn sàng!", 
        Time = 5
    })
end)

-- ============================================
-- NÚT BẤM VỚI DEBUG
-- ============================================
MiscTab:AddButton({
    Name = "Nhập Tất Cả Code",
    Callback = function()
        print("[DEBUG] ========================================")
        print("[DEBUG] 🔘 NÚT BẤM ĐƯỢC NHẤN!")
        print("[DEBUG] ========================================")
        
        print("[DEBUG] Kiểm tra CodeModule:", CodeModule)
        print("[DEBUG] Kiểm tra CodeModule.RedeemAll:", CodeModule and CodeModule.RedeemAll)
        
        if CodeModule and CodeModule.RedeemAll then
            print("[DEBUG] ✓ Module OK, bắt đầu chạy hàm...")
            
            OrionLib:MakeNotification({
                Name = "Đang chạy...", 
                Content = "Hệ thống đang nhập code...", 
                Time = 3
            })
            
            local success, err = pcall(function()
                CodeModule.RedeemAll()
            end)
            
            if success then
                print("[DEBUG] ✓ Hàm RedeemAll chạy thành công!")
                OrionLib:MakeNotification({
                    Name = "Thành công!", 
                    Content = "Đã nhập xong tất cả code!", 
                    Time = 5
                })
            else
                warn("[DEBUG] ✗ LỖI khi chạy RedeemAll:", err)
                OrionLib:MakeNotification({
                    Name = "Lỗi!", 
                    Content = "Lỗi: " .. tostring(err), 
                    Time = 10
                })
            end
        else
            warn("[DEBUG] ✗ Module chưa load hoặc không có hàm RedeemAll!")
            
            if not CodeModule then
                warn("[DEBUG] CodeModule = nil")
            elseif not CodeModule.RedeemAll then
                warn("[DEBUG] CodeModule tồn tại nhưng không có RedeemAll")
            end
            
            OrionLib:MakeNotification({
                Name = "Lỗi!", 
                Content = "Module chưa load! Đợi vài giây hoặc check F9!", 
                Time = 10
            })
        end
    end    
})

print("[DEBUG] Script đã khởi động xong!")
print("[DEBUG] MỞ F9 (Developer Console) ĐỂ XEM LOG!")

OrionLib:Init()
