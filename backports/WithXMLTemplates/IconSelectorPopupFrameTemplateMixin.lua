 
BackportedIconSelectorPopupFrameTemplateMixin = {};

local ValidIconSelectorCursorTypes = {
	"item",
	"spell",
	"mount",
	"battlepet",
	"macro"
};

IconSelectorPopupFrameModes = EnumUtil.MakeEnum(
	"New",
	"Edit"
);

IconSelectorPopupFrameIconFilterTypes = EnumUtil.MakeEnum(
	"All",
	"Spell",
	"Item"
);

local ValidIconSelectorCursorTypes = {
	"item",
	"spell",
	"mount",
	"battlepet",
	"macro"
};

local function IconSelectorPopupFrame_IconFilterToIconTypes(filter)
	if (filter == IconSelectorPopupFrameIconFilterTypes.All) then
		return IconDataProvider_GetAllIconTypes();
	elseif (filter == IconSelectorPopupFrameIconFilterTypes.Spell) then
		return { IconDataProviderIconType.Spell };
	elseif (filter == IconSelectorPopupFrameIconFilterTypes.Item) then
		return { IconDataProviderIconType.Item };
	end
	return nil;
end

local IconSelectorPopupFramesShown = 0;

function BackportedIconSelectorPopupFrameTemplateMixin:OnLoad()
	local function IconButtonInitializer(button, selectionIndex, icon)
		button:SetIconTexture(icon);
	end
	self.IconSelector:SetSetupCallback(IconButtonInitializer);
	self.IconSelector:AdjustScrollBarOffsets(-14, -4, 6);

	self.BorderBox.OkayButton:SetScript("OnClick", function()
		PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK);
		self:OkayButton_OnClick();
	end);

	self.BorderBox.CancelButton:SetScript("OnClick", function()
		PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK);
		self:CancelButton_OnClick();
	end);

	self.BorderBox.EditBoxHeaderText:SetText(self.editBoxHeaderText);

	-- Icon Filter Dropdown
	local function IconFilterTypeNameTranslation(enumValue)
		for key, value in pairs(IconSelectorPopupFrameIconFilterTypes) do
			if value == enumValue then
				return _G["ICON_FILTER_" .. strupper(key)];
			end
		end
	end

	local function IconFilterTypeSelectedCallback(value, isUserInput)
		self:SetIconFilter(value);
	end

	self.BorderBox.IconTypeDropDown:SetControlWidth(125);
	self.BorderBox.IconTypeDropDown:SetTextJustifyH("LEFT");
	self.BorderBox.IconTypeDropDown:SetEnum(IconSelectorPopupFrameIconFilterTypes, IconFilterTypeNameTranslation);
	self.BorderBox.IconTypeDropDown:SetSelectedValue(IconSelectorPopupFrameIconFilterTypes.All);
	self.BorderBox.IconTypeDropDown:SetOptionSelectedCallback(IconFilterTypeSelectedCallback);
end

-- Usually overridden by inheriting frame.
function BackportedIconSelectorPopupFrameTemplateMixin:OnShow()
	IconSelectorPopupFramesShown = IconSelectorPopupFramesShown + 1;

	self:RegisterEvent("CURSOR_CHANGED");
	self:RegisterEvent("GLOBAL_MOUSE_UP");

	self.BorderBox.SelectedIconArea.SelectedIconButton:SetIconSelector(self);
	self.BorderBox.IconSelectorEditBox:SetIconSelector(self);

	self:UpdateStateFromCursorType();
end

-- Usually overridden by inheriting frame.
function BackportedIconSelectorPopupFrameTemplateMixin:OnHide()
	IconSelectorPopupFramesShown = IconSelectorPopupFramesShown - 1;
	self:UnregisterEvent("CURSOR_CHANGED");
	self:UnregisterEvent("GLOBAL_MOUSE_UP");
end

-- Usually overridden by inheriting frame.
function BackportedIconSelectorPopupFrameTemplateMixin:Update()
end

function BackportedIconSelectorPopupFrameTemplateMixin:OnEvent(event, ...)
	if ( event == "CURSOR_CHANGED" ) then
		self:UpdateStateFromCursorType();
	elseif ( event == "GLOBAL_MOUSE_UP" and DoesAncestryInclude(self, GetMouseFocus())) then
		self:SetIconFromMouse();
	end
end

function BackportedIconSelectorPopupFrameTemplateMixin:UpdateStateFromCursorType()
	local cursorType = GetCursorInfo();
	local isValidCursorType = false;
	for _, validType in ipairs(ValidIconSelectorCursorTypes) do
		if ( cursorType == validType ) then
			isValidCursorType = true;
			break;
		end
	end

	self.BorderBox.IconDragArea:SetShown(isValidCursorType);
	self.BorderBox.IconSelectionText:SetShown(not isValidCursorType);
	self.BorderBox.IconTypeDropDown:SetShown(not isValidCursorType);
	self.IconSelector:SetShown(not isValidCursorType);
end

function BackportedIconSelectorPopupFrameTemplateMixin:SetIconFromMouse()
	local cursorType, ID = GetCursorInfo();
	for _, validType in ipairs(ValidIconSelectorCursorTypes) do
		if ( cursorType == validType ) then
			local icon;
			if ( cursorType == "item" ) then
				icon = select(10, GetItemInfo(ID));
			elseif ( cursorType == "spell" ) then
				-- 'ID' field for spells would actually be the slot number, not the actual spellID, so we get this separately.
				local spellID = select(4, GetCursorInfo());
				icon = select(3, GetSpellInfo(spellID));
			elseif ( cursorType == "mount" ) then
				icon = select(3, C_MountJournal.GetMountInfoByID(ID));
			elseif ( cursorType == "battlepet" ) then
				icon = select(9, C_PetJournal.GetPetInfoByPetID(ID));
			elseif ( cursorType == "macro" ) then
				icon = select(2, GetMacroInfo(ID));
			end

			self.IconSelector:SetSelectedIndex(self:GetIndexOfIcon(icon));
			self.IconSelector:ScrollToSelectedIndex();
			ClearCursor();

			if ( icon ) then
				self.BorderBox.SelectedIconArea.SelectedIconButton:SetIconTexture(icon);
			end

			self:SetSelectedIconText();
			break;
		end
	end
end

function BackportedIconSelectorPopupFrameTemplateMixin:SetSelectedIconText()
	if ( self:GetSelectedIndex() ) then
		self.BorderBox.SelectedIconArea.SelectedIconText.SelectedIconDescription:SetText(ICON_SELECTION_CLICK);
		self.BorderBox.SelectedIconArea.SelectedIconText.SelectedIconDescription:SetFontObject(GameFontHighlightSmall);
	else
		self.BorderBox.SelectedIconArea.SelectedIconText.SelectedIconDescription:SetText(ICON_SELECTION_NOTINLIST);
		self.BorderBox.SelectedIconArea.SelectedIconText.SelectedIconDescription:SetFontObject(GameFontDisableSmall);
	end

	self.BorderBox.SelectedIconArea.SelectedIconText:Layout();
end

-- Usually overridden by inheriting frame.
function BackportedIconSelectorPopupFrameTemplateMixin:OkayButton_OnClick()
	self:Hide();
end

-- Usually overridden by inheriting frame.
function BackportedIconSelectorPopupFrameTemplateMixin:CancelButton_OnClick()
	self:Hide();
end

function BackportedIconSelectorPopupFrameTemplateMixin:SetIconFilter(iconFilter)
	if (self.iconFilter == iconFilter) then
		return;
	end

	self.iconFilter = iconFilter;
	local iconTypes = IconSelectorPopupFrame_IconFilterToIconTypes(self.iconFilter);
	self.iconDataProvider:SetIconTypes(iconTypes);
	self.IconSelector:UpdateSelections();
	self:ReevaluateSelectedIcon();
end

function BackportedIconSelectorPopupFrameTemplateMixin:GetIconFilter()
	return self.iconFilter;
end

function BackportedIconSelectorPopupFrameTemplateMixin:GetIconByIndex(index)
	return self.iconDataProvider:GetIconByIndex(index);
end

function BackportedIconSelectorPopupFrameTemplateMixin:GetIndexOfIcon(icon)
	return self.iconDataProvider:GetIndexOfIcon(icon);
end

function BackportedIconSelectorPopupFrameTemplateMixin:GetNumIcons()
	return self.iconDataProvider:GetNumIcons();
end

function BackportedIconSelectorPopupFrameTemplateMixin:GetSelectedIndex()
	return self.IconSelector:GetSelectedIndex();
end

function BackportedIconSelectorPopupFrameTemplateMixin:ReevaluateSelectedIcon()
	local texture = self.BorderBox.SelectedIconArea.SelectedIconButton:GetIconTexture();
	self.IconSelector:SetSelectedIndex(self:GetIndexOfIcon(texture));
	self:SetSelectedIconText();
end

function IsAnyIconSelectorPopupFrameShown()
	return IconSelectorPopupFramesShown and IconSelectorPopupFramesShown > 0;
end