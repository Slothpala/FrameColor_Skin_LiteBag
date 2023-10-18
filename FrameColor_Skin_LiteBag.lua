local info = {
    moduleName = "LiteBag",
    color1 = {
        name = "Main",
        desc = "",
    },
    color3 = {
        name = "Tabs",
        desc = "",
    },
}

local module = FrameColor_CreateSkinModule(info)

function module:OnEnable()
    local main_color = self:GetColor1()
    local tab_color = self:GetColor3()
    self:Recolor(main_color, tab_color, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(main_color, tab_color, desaturation)
    --recolor frames
    for _ ,frame in pairs({
        LiteBagBackpack,
        LiteBagBank
    }) do 
        for _, texture in pairs({
            frame.NineSlice.TopEdge,
            frame.NineSlice.BottomEdge,
            frame.NineSlice.TopRightCorner,
            frame.NineSlice.TopLeftCorner,
            frame.NineSlice.RightEdge,
            frame.NineSlice.LeftEdge,
            frame.NineSlice.BottomRightCorner,
            frame.NineSlice.BottomLeftCorner,  
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(main_color.r,main_color.g,main_color.b) 
        end
    end
    --recolor tabs
    for _ ,frame in pairs({
        LiteBagBankTab1,
        LiteBagBankTab2,
    }) do 
        for _,texture in pairs({
            frame.Left,
            frame.Middle,
            frame.Right,
        }) do
            texture:SetDesaturation(desaturation)  
            texture:SetVertexColor(tab_color.r,tab_color.g,tab_color.b) 
        end
    end
end

