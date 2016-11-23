SanaUIHealer = CreateFrame("Frame", "Sana");
SanaUIHealer:ClearAllPoints();

local Backdrop = {
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
  tileSize = 32,
  edgeFile = "Interface\\FriendsFrame\\UI-Toast-Border",
  tile = 1,
  edgeSize = 7,
  insets = {
    top = 2,
    right = 2,
    left = 3,
    bottom = 3,
  },
};

SanaUIHealer:SetBackdrop(Backdrop);
SanaUIHealer:SetHeight(500);
SanaUIHealer:SetWidth(210);
SanaUIHealer:SetFrameStrata("HIGH");
SanaUIHealer:SetMovable(true);
SanaUIHealer:SetPoint("CENTER")

local TitleBar = CreateFrame("Frame", nil, SanaUIHealer);
TitleBar:SetPoint("TOPLEFT", 1, -1);
TitleBar:SetPoint("TOPRIGHT", -2, -1);
TitleBar:SetHeight(16);

Backdrop.edgeSize = 2;
Backdrop.insets.bottom = 1;
TitleBar:SetBackdrop(Backdrop);
TitleBar:SetBackdropColor(0, 0, 0, 1);

TitleBar:SetScript("OnMouseUp",
  function ()
    SanaUIHealer:StopMovingOrSizing();

    local Point, RelativeTo, RelativePoint, X, Y = SanaUIHealer:GetPoint();
    SetSetting("UIAnchorPoint", Point);
    SetSetting("UIX", X);
    SetSetting("UIY", Y);
  end
);
TitleBar:SetScript("OnMouseDown", function () SanaUIHealer:StartMoving(); end);

local function Divider (Name, xcord, ycord)
  local Label = SanaUIHealer:CreateFontString(nil, "HIGH");
  Label:SetAllPoints();
  Label:SetFont("Fonts\\ARIALN.TTF", 11, "OUTLINE");
  Label:SetText(Name);
  Label:SetPoint("TOPLEFT", xcord, ycord)

  return Label;
end

local TitleBarText = TitleBar:CreateFontString();
TitleBarText:SetAllPoints(TitleBar);
TitleBarText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE");
TitleBarText:SetText("Sana Healer");
TitleBarText:SetJustifyH("CENTER");

local CloseButton = CreateFrame("Button", nil, TitleBar, "UIPanelCloseButton");
CloseButton:SetPoint("TOPRIGHT", 1, 1);
CloseButton:SetHeight(18);
CloseButton:SetWidth(18);
CloseButton:SetScript("OnClick", function () SanaUIHealer:Hide(); end);

local function AddBox(xcoord, ycoord, configop, changed)
  local EditBox = CreateFrame("EditBox", "MainFrame", SanaUIHealer, "InputBoxTemplate")
  EditBox:SetPoint("TOPLEFT", xcoord, ycoord)
  EditBox:SetHeight(20)
  EditBox:SetWidth(30)
  EditBox:SetAutoFocus(false)
  EditBox:SetText(configop)
  EditBox:SetScript("OnEnterPressed", changed)
  return EditBox
end

Divider("Rejuvenation", 0,440)
AddBox(25, -20, Config.Healer_Rejuvenation_Max, function (EditBox) Config.Healer_Rejuvenation_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -20, Config.Healer_Rejuvenation_Min, function (EditBox) Config.Healer_Rejuvenation_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Lifebloom", 0,360)
AddBox(25, -60, Config.Healer_Lifebloom_Max, function (EditBox) Config.Healer_Lifebloom_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -60, Config.Healer_Lifebloom_Min, function (EditBox) Config.Healer_Lifebloom_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Regrowth", 0,280)
AddBox(25, -100, Config.Healer_Regrowth_Max, function (EditBox) Config.Healer_Regrowth_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -100, Config.Healer_Regrowth_Min, function (EditBox) Config.Healer_Regrowth_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Regr. Buff", 0,200)
AddBox(25, -140, Config.Healer_Regrowth_Buff_Max, function (EditBox) Config.Healer_Regrowth_Buff_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -140, Config.Healer_Regrowth_Buff_Min, function (EditBox) Config.Healer_Regrowth_Buff_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Healing Touch", 0,120)
AddBox(25, -180, Config.Healer_Healing_Touch_Max, function (EditBox) Config.Healer_Healing_Touch_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -180, Config.Healer_Healing_Touch_Min, function (EditBox) Config.Healer_Healing_Touch_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Swift Mend", 0,40)
AddBox(25, -220, Config.Healer_Swift_Mend_Max, function (EditBox) Config.Healer_Swift_Mend_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -220, Config.Healer_Swift_Mend_Min, function (EditBox) Config.Healer_Swift_Mend_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Ess. Of. Gh", 0,-40)
AddBox(25, -260, Config.Healer_Essence_Of_Ghanir_Max, function (EditBox) Config.Healer_Essence_Of_Ghanir_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -260, Config.Healer_Essence_Of_Ghanir_Min, function (EditBox) Config.Healer_Essence_Of_Ghanir_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Cenarion Ward", 0,-120)
AddBox(25, -300, Config.Healer_Cenarion_Ward_Max, function (EditBox) Config.Healer_Cenarion_Ward_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -300, Config.Healer_Cenarion_Ward_Min, function (EditBox) Config.Healer_Cenarion_Ward_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("TOL", 0,-200)
AddBox(25, -340, Config.Healer_Incarnation_Tree_Of_Life_Max, function (EditBox) Config.Healer_Incarnation_Tree_Of_Life_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -340, Config.Healer_Incarnation_Tree_Of_Life_Min, function (EditBox) Config.Healer_Incarnation_Tree_Of_Life_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("TOL Rejuv", 0,-280)
AddBox(25, -380, Config.Healer_Incarnation_Tree_Of_Life_Rejuv_Max, function (EditBox) Config.Healer_Incarnation_Tree_Of_Life_Rejuv_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -380, Config.Healer_Incarnation_Tree_Of_Life_Rejuv_Min, function (EditBox) Config.Healer_Incarnation_Tree_Of_Life_Rejuv_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("TOL Regrow", 0,-360)
AddBox(25, -420, Config.Healer_Incarnation_Tree_Of_Life_Regrowth_Max, function (EditBox) Config.Healer_Incarnation_Tree_Of_Life_Regrowth_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -420, Config.Healer_Incarnation_Tree_Of_Life_Regrowth_Min, function (EditBox) Config.Healer_Incarnation_Tree_Of_Life_Regrowth_Min = EditBox:GetNumber() EditBox:ClearFocus() end)
Divider("Ironbark", 0,-440)
AddBox(25, -460, Config.Healer_Ironbark_Max, function (EditBox) Config.Healer_Ironbark_Max = EditBox:GetNumber() EditBox:ClearFocus() end)
AddBox(160, -460, Config.Healer_Ironbark_Min, function (EditBox) Config.Healer_Ironbark_Min = EditBox:GetNumber() EditBox:ClearFocus() end)

SanaUIHealer:Hide()
