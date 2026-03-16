hs.hotkey.bind({"ctrl"}, "space", function()
    local app = hs.application.find("cmux")
    if app then
        if app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("cmux")
    end
end)
