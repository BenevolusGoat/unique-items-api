local mcm = {}

local modName = UniqueItemsAPI.Name

local displayPlayers = {
	Collectibles = {},
	Familiars = {},
	Knives = {},
	Effects = {}
}

---@param noItems boolean
function mcm:GenerateModConfigMenu(noItems)
	if ModConfigMenu == nil then return end
	if type(ModConfigMenu.GetCategoryIDByName(modName)) == "number" then
		ModConfigMenu.RemoveCategory(modName)
	end

	ModConfigMenu.AddSpace(modName, "Info")
	ModConfigMenu.AddText(modName, "Info", "Unique Items API")
	ModConfigMenu.AddSpace(modName, "Info")
	ModConfigMenu.AddText(modName, "Info", "Version " .. UniqueItemsAPI.Version)
	ModConfigMenu.AddSpace(modName, "Info")
	ModConfigMenu.AddText(modName, "Info", "by Sanio")
	local categoryID = ModConfigMenu.GetCategoryIDByName(modName)

	if noItems then
		ModConfigMenu.AddText(modName, "General", "No other compatible mods are installed!")
		ModConfigMenu.AddText(modName, "General", "Please install a mod that uses this API.")
		return
	end

	ModConfigMenu.AddSetting(modName, "General", {
		Type = ModConfigMenu.OptionType.BOOLEAN,
		CurrentSetting = function() return UniqueItemsAPI.DisableAll end,
		Display = function()
			local onOff = "False"
			if UniqueItemsAPI.DisableAll then
				onOff = "True"
			end
			return "Disabled: " .. onOff
		end,
		OnChange = function(currentBool)
			UniqueItemsAPI.DisableAll = currentBool
		end,
		Info =
		"Disables all content linked with the API. Overrides the current settings for all unique items."
	})
	ModConfigMenu.AddSetting(modName, "General", {
		Type = ModConfigMenu.OptionType.BOOLEAN,
		CurrentSetting = function() return UniqueItemsAPI.RandomizeAll end,
		Display = function()
			local onOff = "False"
			if UniqueItemsAPI.RandomizeAll then
				onOff = "True"
			end
			return "Randomize: " .. onOff
		end,
		OnChange = function(currentBool)
			UniqueItemsAPI.RandomizeAll = currentBool
		end,
		Info =
		"Randomizes settings on what mod is used for every character with every item, if more than one mod is available for that character."
	})

	for tableName, objectTable in pairs(UniqueItemsAPI.ObjectData) do
		local subcategoryName = tableName

		local canCreate = false

		for _, objectData in pairs(objectTable) do
			for _, playerData in pairs(objectData.AllPlayers) do
				for _, modData in pairs(playerData.ModData) do
					if not modData.LinkedUniqueObject then
						canCreate = true
						break
					end
					if canCreate then break end
				end
				if canCreate then break end
			end
			if canCreate then break end
		end

		if not canCreate then goto continue end

		if next(objectTable) then
			ModConfigMenu.UpdateSubcategory(modName, subcategoryName, {
				Name = subcategoryName,
				Info = "API Settings for " .. string.lower(tableName) .. ": " .. subcategoryName
			})
		end

		local lastOptionID = 0
		---@param ID integer
		---@param objectData UniqueObjectData
		for ID, objectData in pairs(objectTable) do
			local optionID = 0 + lastOptionID
			displayPlayers[tableName][ID] = {}
			local playerNames = displayPlayers[tableName][ID]
			for playerType, _ in pairs(objectData.AllPlayers) do
				table.insert(playerNames, playerType)
			end
			table.sort(playerNames)


			optionID = optionID + 1
			ModConfigMenu.AddTitle(modName, subcategoryName, objectData.DisplayName)

			if #playerNames > 1 then
				optionID = optionID + 1

				--AFFECT ALL
				ModConfigMenu.AddSetting(modName, subcategoryName, {
					Type = ModConfigMenu.OptionType.NUMBER,
					CurrentSetting = function()
						return objectData.SelectedModIndex
					end,
					Minimum = #objectData.AllMods > 1 and -1 or 0,
					Maximum = #objectData.AllMods,
					ModifyBy = 1,
					Display = function()
						local display = ""
						if objectData.SelectedModIndex == 0 then
							display = "Disabled"
						elseif objectData.SelectedModIndex == -1 then
							display = "Randomized"
						else
							local settingName = objectData.AllMods[objectData.SelectedModIndex]
							if #objectData.AllMods > 1 then
								settingName = settingName ..
								" (" .. objectData.SelectedModIndex .. "/" .. #objectData.AllMods .. ")"
							end
							display = settingName
						end
						return "All: " .. display
					end,
					OnChange = function(currentNum)
						objectData.SelectedModIndex = currentNum
						for _, playerData in pairs(objectData.AllPlayers) do
							for j, modData in ipairs(playerData.ModData) do
								if currentNum == 0 or #playerData.ModData > 1 and currentNum == -1 then
									playerData.SelectedModIndex = currentNum
								elseif objectData.AllMods[objectData.SelectedModIndex] == modData.ModName then
									playerData.SelectedModIndex = j
								end
							end
						end
					end,
					Info = "Changes settings for all characters if the setting is available to them."
				})
			end

			optionID = optionID + 1

			--CHARACTER
			ModConfigMenu.AddSetting(modName, subcategoryName, {
				Type = ModConfigMenu.OptionType.NUMBER,
				CurrentSetting = function()
					return objectData.SelectedPlayerIndex
				end,
				Minimum = 1,
				Maximum = #playerNames,
				ModifyBy = 1,
				Display = function()
					local characterName = UniqueItemsAPI.RegisteredCharacters
					[playerNames[objectData.SelectedPlayerIndex]].DisplayName
					local settingName = #playerNames > 1 and
					characterName .. " (" .. objectData.SelectedPlayerIndex .. "/" .. #playerNames .. ")" or
					characterName
					return "Character: " .. settingName
				end,
				OnChange = function(currentNum)
					objectData.SelectedPlayerIndex = currentNum
				end
			})

			local function getMinOrMaxSetting(max)
				local currentModData = objectData.AllPlayers[playerNames[objectData.SelectedPlayerIndex]].ModData
				local numLinkedObjects = 0
				for _, objectModData in pairs(currentModData) do
					if objectModData.LinkedUniqueObject then
						numLinkedObjects = numLinkedObjects + 1
					end
				end
				if max then
					return (#currentModData - numLinkedObjects)
				else
					return (#currentModData - numLinkedObjects) > 1 and -1 or 0
				end
			end

			optionID = optionID + 1

			--CHOOSE SETTING
			ModConfigMenu.AddSetting(modName, subcategoryName, {
				Type = ModConfigMenu.OptionType.NUMBER,
				CurrentSetting = function()
					local playerData = objectData.AllPlayers[playerNames[objectData.SelectedPlayerIndex]]
					return playerData.SelectedModIndex
				end,
				Minimum = getMinOrMaxSetting(false),
				Maximum = getMinOrMaxSetting(true),
				ModifyBy = 1,
				Display = function()
					local playerData = objectData.AllPlayers[playerNames[objectData.SelectedPlayerIndex]]
					local selectedModIndex = playerData.SelectedModIndex
					local display = ""
					if selectedModIndex == 0 then
						display = "Disabled"
					elseif selectedModIndex == -1 then
						display = "Randomized"
					elseif not playerData.ModData[selectedModIndex] then
						return "ERROR: No data at index " .. selectedModIndex
					else
						local settingName = playerData.ModData[selectedModIndex].ModName
						if #playerData.ModData > 1 then
							settingName = settingName ..
							" (" .. playerData.SelectedModIndex .. "/" .. #playerData.ModData .. ")"
						end
						display = settingName
					end

					return "Skin: " .. display
				end,
				OnChange = function(currentNum)
					local playerData = objectData.AllPlayers[playerNames[objectData.SelectedPlayerIndex]]
					while playerData.ModData[currentNum] and playerData.ModData[currentNum].LinkedUniqueObject do
						--We don't want "Linked" objects to be selectable. Skip over it until you find a new valid option.
						--There should be at least one available since this tab can't be created otherwise
						local min, max = getMinOrMaxSetting(false), getMinOrMaxSetting(true)
						local direction = Input.IsActionTriggered(ButtonAction.ACTION_LEFT, Isaac.GetPlayer().ControllerIndex) and -1 or 1
						currentNum = currentNum + direction
						if currentNum < min then
							currentNum = max
						elseif currentNum > max then
							currentNum = min
						end
					end
					playerData.SelectedModIndex = currentNum
					local currentOption = ModConfigMenu.MenuData[categoryID].Subcategories
					[ModConfigMenu.GetSubcategoryIDByName(categoryID, subcategoryName)].Options[optionID]
					currentOption.Minimum = getMinOrMaxSetting(false)
					currentOption.Maximum = getMinOrMaxSetting(true)
				end
			})

			lastOptionID = optionID + 1
			ModConfigMenu.AddSpace(modName, subcategoryName)
		end
	    ::continue::
	end
end

return mcm
