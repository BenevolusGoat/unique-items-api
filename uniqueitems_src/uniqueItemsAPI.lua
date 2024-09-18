---@class UniqueObjectData
---@field SelectedModIndex integer
---@field AllMods string[]
---@field AllPlayers UniqueObjectParams[]

---@class UniqueObjectPlayerData
---@field Disabled boolean
---@field Randomized boolean
---@field SelectedModIndex integer
---@field ModData UniqueObjectModData

---@class UniqueObjectModData
---@field ModName string
---@field SpritePath string[]
---@field CostumeSpritePath string
---@field NullCostume integer

---@class UniqueObjectParams
---@field ModName string
---@field PlayerType PlayerType
---@field ObjectID integer
---@field Anm2 string
---@field SpritePath string[]
---@field DisableByDefault boolean
---@field CostumeSpritePath string | nil
---@field NullCostume NullItemID | nil
---@field SwordProjectile {Beam: string, Splash: string} | nil

---@class OldObjectParams: UniqueObjectParams
---@field ItemSprite string | string[]
---@field ItemID CollectibleType
---@field FamiliarVariant FamiliarVariant
---@field FamiliarSprite string | string[]
---@field KnifeVariant integer
---@field KnifeSprite string | string[]
---@field DisabledOnFirstLoad boolean

local lastRegisteredMod = ""

UniqueItemsAPI.RandomizeAll = true
UniqueItemsAPI.DisableAll = true
UniqueItemsAPI.RegisteredMods = {}
UniqueItemsAPI.RegisteredCharacters = {}

---@type {Collectibles: UniqueObjectData[], Familiars: UniqueObjectData[], Knives: UniqueObjectData[]}
UniqueItemsAPI.ObjectData = {
	Collectibles = {},
	Familiars = {},
	Knives = {}
}
UniqueItemsAPI.ObjectModifiers = {
	Collectibles = {},
	Familiars = {},
	Knives = {}
}
---@enum UniqueObjectType
UniqueItemsAPI.ObjectType = {
	ITEM = 1,
	FAMILIAR = 2,
	KNIFE = 3
}
local itemTypeToTableName = {
	[UniqueItemsAPI.ObjectType.ITEM] = "Collectibles",
	[UniqueItemsAPI.ObjectType.FAMILIAR] = "Familiars",
	[UniqueItemsAPI.ObjectType.KNIFE] = "Knives",
}

---@type table<PlayerType, string>
local normalNames = {
	[PlayerType.PLAYER_ISAAC] = "Isaac",
	[PlayerType.PLAYER_MAGDALENE] = "Magdalene",
	[PlayerType.PLAYER_CAIN] = "Cain",
	[PlayerType.PLAYER_JUDAS] = "Judas",
	[PlayerType.PLAYER_BLUEBABY] = "Blue Baby",
	[PlayerType.PLAYER_EVE] = "Eve",
	[PlayerType.PLAYER_SAMSON] = "Samson",
	[PlayerType.PLAYER_AZAZEL] = "Azazel",
	[PlayerType.PLAYER_LAZARUS] = "Lazarus",
	[PlayerType.PLAYER_EDEN] = "Eden",
	[PlayerType.PLAYER_THELOST] = "The Lost",
	[PlayerType.PLAYER_LAZARUS2] = "Lazarus II",
	[PlayerType.PLAYER_BLACKJUDAS] = "Dark Judas",
	[PlayerType.PLAYER_LILITH] = "Lilith",
	[PlayerType.PLAYER_KEEPER] = "Keeper",
	[PlayerType.PLAYER_APOLLYON] = "Apollyon",
	[PlayerType.PLAYER_THEFORGOTTEN] = "The Forgotten",
	[PlayerType.PLAYER_THESOUL] = "The Soul",
	[PlayerType.PLAYER_BETHANY] = "Bethany",
	[PlayerType.PLAYER_JACOB] = "Jacob",
	[PlayerType.PLAYER_ESAU] = "Esau"
}
---@type table<PlayerType, string>
local taintedNames = {
	[PlayerType.PLAYER_ISAAC_B] = "Isaac",
	[PlayerType.PLAYER_MAGDALENE_B] = "Magdalene",
	[PlayerType.PLAYER_CAIN_B] = "Cain",
	[PlayerType.PLAYER_JUDAS_B] = "Judas",
	[PlayerType.PLAYER_BLUEBABY_B] = "Blue Baby",
	[PlayerType.PLAYER_EVE_B] = "Eve",
	[PlayerType.PLAYER_SAMSON_B] = "Samson",
	[PlayerType.PLAYER_AZAZEL_B] = "Azazel",
	[PlayerType.PLAYER_LAZARUS_B] = "Alive Lazarus",
	[PlayerType.PLAYER_EDEN_B] = "Eden",
	[PlayerType.PLAYER_THELOST_B] = "The Lost",
	[PlayerType.PLAYER_LILITH_B] = "Lilith",
	[PlayerType.PLAYER_KEEPER_B] = "Keeper",
	[PlayerType.PLAYER_APOLLYON_B] = "Apollyon",
	[PlayerType.PLAYER_THEFORGOTTEN_B] = "The Forgotten",
	[PlayerType.PLAYER_BETHANY_B] = "Bethany",
	[PlayerType.PLAYER_JACOB_B] = "Jacob",
	[PlayerType.PLAYER_LAZARUS2_B] = "Dead Lazarus",
	[PlayerType.PLAYER_JACOB2_B] = "Ghost Jacob",
	[PlayerType.PLAYER_THESOUL_B] = "The Soul",
}

for playerType = 0, PlayerType.NUM_PLAYER_TYPES - 1 do
	local isTainted = playerType >= PlayerType.PLAYER_ISAAC_B
	UniqueItemsAPI.RegisteredCharacters[playerType] = {
		Name = isTainted and taintedNames[playerType] or normalNames[playerType],
		ModName = "Vanilla",
		IsTainted = isTainted
	}
end

--#region helper functions

---@param funcName string
---@param invalidVar any
---@param varName string
---@param expectedType string
---@param extraLayer? boolean
local function callArgumentError(funcName, invalidVar, varName, expectedType, extraLayer)
	local err = "Something went wrong in " .. funcName .. "!"

	if expectedType ~= nil then
		err = "Bad Argument '" ..
			varName ..
			"' in " ..
			funcName ..
			" (Attempt to index a " ..
			type(invalidVar) .. " value, field '" .. tostring(invalidVar) .. "', expected " .. expectedType .. ")."
	end
	err = "[UniqueItemsAPI] " .. err
	error(err, extraLayer and 4 or 3)
	Isaac.DebugString(err)
end

---@param funcName string
---@param invalidVar any
---@param num integer
---@param expectedType string
---@param extraLayer? boolean
local function callArgumentNumberError(funcName, invalidVar, num, expectedType, extraLayer)
	local err = "Something went wrong in " .. funcName .. "!"

	if expectedType ~= nil then
		err = "Bad Argument #" ..
			num ..
			" in " ..
			funcName ..
			" (Attempt to index a " ..
			type(invalidVar) .. " value, field '" .. tostring(invalidVar) .. "', expected " .. expectedType .. ")."
	end
	err = "[UniqueItemsAPI] " .. err
	error(err, extraLayer and 4 or 3)
	Isaac.DebugString(err)
end

---@param err string
---@param extraLayer? boolean
local function callError(err, extraLayer)
	err = "[UniqueItemsAPI] " .. err
	error(err, extraLayer and 4 or 3)
	Isaac.DebugString(err)
end

function UniqueItemsAPI.GetFirstAlivePlayer()
	for index = 0, UniqueItemsAPI.Game:GetNumPlayers() - 1 do
		local player = Isaac.GetPlayer(index)
		if not player:IsCoopGhost() then return player end
	end
end

---@param ent Entity
function UniqueItemsAPI.TryGetPlayer(ent)
	if ent:ToPlayer() then return ent:ToPlayer() end
	local spawnEnt = ent.SpawnerEntity
	if not spawnEnt then return end

	if spawnEnt:ToPlayer() then
		return spawnEnt:ToPlayer()
	elseif spawnEnt:ToFamiliar() and spawnEnt:ToFamiliar().Player then
		return spawnEnt:ToFamiliar().Player
	else
		UniqueItemsAPI.TryGetPlayer(ent.SpawnerEntity)
	end
end

--#endregion

--#region api

---@param name string
function UniqueItemsAPI.IsModRegistered(name)
	if #UniqueItemsAPI.RegisteredMods == 0 then
		return false
	end
	for _, modName in pairs(UniqueItemsAPI.RegisteredMods) do
		if name == modName then
			return true
		end
	end
	return false
end

---@param name string
---@param isTainted boolean
function UniqueItemsAPI.IsCharacterRegistered(name, isTainted)
	local funcName = "IsCharacterRegistered"
	if name == nil or type(name) ~= "string" then
		callArgumentNumberError(funcName, name, 1, "string")
		return
	end
	if isTainted == nil then
		isTainted = false
	elseif type(isTainted) ~= "boolean" then
		callArgumentNumberError(funcName, isTainted, 2, "boolean")
		return
	end
	local playerType = Isaac.GetPlayerTypeByName(name, isTainted)
	return UniqueItemsAPI.RegisteredCharacters[playerType] ~= nil
end

---@param modName string
function UniqueItemsAPI.RegisterMod(modName)
	local funcName = "RegisterMod"
	if UniqueItemsAPI.IsModRegistered(modName) then return end
	if modName == nil or type(modName) ~= "string" then
		callArgumentNumberError(funcName, modName, 1, "string")
		return
	end
	table.insert(UniqueItemsAPI.RegisteredMods, modName)
	lastRegisteredMod = modName
end

---@param name string
---@param isTainted boolean
---@param displayName? string
function UniqueItemsAPI.RegisterCharacter(name, isTainted, displayName)
	local funcName = "RegisterCharacter"
	if name == nil or type(name) ~= "string" then
		callArgumentNumberError(funcName, name, 1, "string")
		return
	end
	if isTainted == nil then
		isTainted = false
	elseif type(isTainted) ~= "boolean" then
		callArgumentNumberError(funcName, isTainted, 2, "boolean")
		return
	end
	local playerType = Isaac.GetPlayerTypeByName(name, isTainted)
	if playerType == -1 then return end
	UniqueItemsAPI.RegisteredCharacters[playerType] = {
		Name = displayName or name,
		ModName = lastRegisteredMod,
		IsTainted = isTainted
	}
end

---@param objectID CollectibleType
---@param itemName string
---@param itemType UniqueObjectType
function UniqueItemsAPI.AssignObjectName(objectID, itemName, itemType)
	local funcName = "RegisterObject"
	if objectID == nil or type(objectID) ~= "number" then
		callArgumentNumberError(funcName, objectID, 1, "number")
		return
	end
	if itemName == nil and type(itemName) ~= "string" then
		callArgumentNumberError(funcName, itemName, 2, "string")
		return
	end
	local itemConfigItem = Isaac.GetItemConfig():GetCollectible(objectID)
	local uniqueItemTable = itemTypeToTableName[itemType]

	if not UniqueItemsAPI.ObjectData[uniqueItemTable] then
		local itemData = {}
		itemData.SelectedModIndex = 1
		itemData.AllMods = {}
		itemData.AllPlayers = {}
		UniqueItemsAPI.ObjectData[uniqueItemTable][objectID] = itemData
	end
	UniqueItemsAPI.ObjectData[uniqueItemTable][objectID].Name = itemName or itemConfigItem.Name
end

---@param funcName string
---@param params UniqueObjectParams
---@param dataType UniqueObjectType
local function shouldDataBeAdded(funcName, params, dataType)
	local shouldAdd = true

	if params.PlayerType == nil
		or type(params.PlayerType) ~= "number"
	then
		callArgumentError(funcName, params.PlayerType, "PlayerType", "number", true)
		return
	elseif params.PlayerType == -1 then
		return
	end
	if lastRegisteredMod == "" then
		local err = "Error in " .. funcName .. ", no mods registered to add to!"
		callError(err, true)
	end

	if params.ObjectID == nil
		or type(params.ObjectID) ~= "number"
	then
		callArgumentError(funcName, params.ObjectID, "ID", "number", true)
	end
	if params.SpritePath == nil
		or type(params.SpritePath) ~= "table"
	then
		callArgumentError(funcName, params.SpritePath, "SpritePath", "table", true)
	end

	if dataType == UniqueItemsAPI.ObjectType.ITEM then
		if params.CostumeSpritePath ~= nil then
			if type(params.CostumeSpritePath) ~= "string" then
				callArgumentError(funcName, params.CostumeSpritePath, "CostumeSpritePath", "string", true)
			end
		end
		if params.NullCostume ~= nil then
			if type(params.NullCostume) ~= "number" then
				callArgumentError(funcName, params.NullCostume, "NullCostume", "NullItemID", true)
			elseif params.NullCostume == -1 then
				local err = "Bad Enumeration 'NullCostume' in " ..
					funcName .. " (Costume returns -1, and does not exist)"
				callError(err, true)
			end
		end
	elseif dataType == UniqueItemsAPI.ObjectType.KNIFE then
		if params.SwordProjectile ~= nil then
			if type(params.SwordProjectile) ~= "table" then
				callArgumentError(funcName, params.SwordProjectile, "KnifeSprite", "table")
			end
		end
	end

	return shouldAdd
end

---@return "Collectibles" | "Familiars" | "Knives"
local function getUniqueObjectName(itemType)
	return itemTypeToTableName[itemType]
end

---@param objectID integer
---@param itemType UniqueObjectType
---@param playerType? PlayerType
---@return UniqueObjectPlayerData
---@overload fun(objectID: integer, itemType: UniqueObjectType): UniqueObjectData
function UniqueItemsAPI.GetObjectData(objectID, itemType, playerType)
	local uniqueItemTable = getUniqueObjectName(itemType)
	local itemData = UniqueItemsAPI.ObjectData[uniqueItemTable][objectID]
	if playerType then
		return itemData.AllPlayers[playerType]
	else
		return itemData
	end
end

---@param params UniqueObjectParams
---@param itemType UniqueObjectType
function UniqueItemsAPI.AssignUniqueObject(params, itemType)
	local funcName = "AssignUniqueObject"
	if not shouldDataBeAdded(funcName, params, itemType) then return end

	local uniqueItemTable = getUniqueObjectName(itemType)
	if not UniqueItemsAPI.ObjectData[uniqueItemTable] then
		local objectData = {}
		objectData.SelectedModIndex = 1
		objectData.AllMods = {}
		objectData.AllPlayers = {}
		UniqueItemsAPI.ObjectData[uniqueItemTable][params.ObjectID] = objectData
	end

	---@type UniqueObjectData
	local itemData = UniqueItemsAPI.ObjectData[uniqueItemTable][params.ObjectID]

	if not itemData.AllPlayers[params.PlayerType] then
		local playerData = {}
		playerData.Disabled = params.DisableByDefault or false
		playerData.Randomized = false
		playerData.SelectedModIndex = 1
		playerData.ModData = {}
		itemData.AllPlayers[params.PlayerType] = playerData
	end
	local playerData = UniqueItemsAPI.GetObjectData(params.ObjectID, itemType, params.PlayerType)
	local modStats = {
		ModName = lastRegisteredMod,
		SpritePath = params.SpritePath,
		CostumeSpritePath = params.CostumeSpritePath,
		NullCostume = params.NullCostume
	}
	table.insert(playerData.ModData, modStats)
end

local function shouldModifierBeAdded(funcName, modifierName, funcCondition, funcCallback, table)
	if modifierName == nil or type(modifierName) ~= "string" then
		callArgumentNumberError(funcName, modifierName, 1, "string", true)
		return false
	elseif funcCondition == nil or type(funcCondition) ~= "function" then
		callArgumentNumberError(funcName, funcCondition, 2, "function", true)
		return false
	elseif funcCallback == nil or type(funcCallback) ~= "function" then
		callArgumentNumberError(funcName, funcCallback, 3, "function", true)
		return false
	end
	for i, v in ipairs(table) do
		if v.Name == modifierName then
			v.Condition = funcCondition
			v.Callback = funcCallback
			return false
		end
	end
	return true
end

---@param modifierName string
---@param funcCondition function
---@param funcCallback function
---@param itemType UniqueObjectType
function UniqueItemsAPI.AddObjectModifier(modifierName, funcCondition, funcCallback, itemType)
	local funcName = "AddUniqueObjectModifier"
	local objectName = getUniqueObjectName(itemType)

	if shouldModifierBeAdded(funcName, modifierName, funcCondition, funcCallback, UniqueItemsAPI.ObjectModifiers[objectName]) then
		table.insert(UniqueItemsAPI.ObjectModifiers[objectName],
			{ Name = modifierName, Condition = funcCondition, Callback = funcCallback })
	end
end

---@param modifierName string
---@param itemType UniqueObjectType
function UniqueItemsAPI.RemoveObjectModifier(modifierName, itemType)
	local objectName = getUniqueObjectName(itemType)
	local objectTable = UniqueItemsAPI.ObjectModifiers[objectName]

	for i, v in ipairs(objectTable) do
		if v.Name == modifierName then
			table.remove(objectTable, i)
			return
		end
	end
end

---@param params UniqueObjectParams
---@param itemType UniqueObjectType
local function patchObjectDataWithModifiers(params, itemType)
	local objectName = getUniqueObjectName(itemType)
	for _, funcs in ipairs(UniqueItemsAPI.ObjectModifiers[objectName]) do
		if funcs.Condition(params) == true then
			params = funcs.Callback(params) or params
		end
	end
	return params
end

---@param objectID integer
---@param entityOrPlayerType Entity | PlayerType
---@param noModifier? boolean
---@param itemType UniqueObjectType
---@return UniqueObjectParams | nil
function UniqueItemsAPI.GetObjectParams(objectID, entityOrPlayerType, noModifier, itemType)
	local playerType = entityOrPlayerType
	local player
	if type(entityOrPlayerType) ~= "number" then
		---@cast entityOrPlayerType Entity
		player = UniqueItemsAPI.TryGetPlayer(entityOrPlayerType)
		if not player then return end
		playerType = player:GetPlayerType()
	end
	---@cast playerType PlayerType

	local playerData = UniqueItemsAPI.GetObjectData(objectID, itemType, playerType)
	if not playerData then return end
	local params = {}

	for varName, value in pairs(playerData.ModData[playerData.SelectedModIndex]) do
		params[varName] = value
	end

	if player then
		params.Player = player
	end

	params.PlayerType = playerType
	params.ItemID = objectID

	if noModifier then return params end

	params = patchObjectDataWithModifiers(params, itemType)

	return params
end

---@param objectID integer
---@param playerType PlayerType
---@param itemType UniqueObjectType
function UniqueItemsAPI.GetCurrentObjectMod(objectID, playerType, itemType)
	local playerData = UniqueItemsAPI.GetObjectData(objectID, itemType, playerType)
	if not playerData then return end
	return playerData.ModData[playerData.SelectedModIndex]
end

---@param objectID integer
---@param playerType PlayerType
---@param bool boolean
---@param itemType UniqueObjectType
function UniqueItemsAPI.ToggleCharacterObject(objectID, playerType, bool, itemType)
	if not bool or type(bool) ~= "boolean" then return end
	local playerData = UniqueItemsAPI.GetObjectData(objectID, itemType, playerType)
	if not playerData then return end
	playerData.Disabled = not bool
end

--#endregion

--#region deprecated

---@deprecated
---@param id integer
---@param name string
function UniqueItemsAPI.RegisterItem(id, name)
	if not name then return end
	UniqueItemsAPI.AssignObjectName(id, name, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param id integer
---@param name string
function UniqueItemsAPI.RegisterFamiliar(id, name)
	if not name then return end
	UniqueItemsAPI.AssignObjectName(id, name, UniqueItemsAPI.ObjectType.FAMILIAR)
end

---@deprecated
---@param id integer
---@param name string
function UniqueItemsAPI.RegisterKnife(id, name)
	if not name then return end
	UniqueItemsAPI.AssignObjectName(id, name, UniqueItemsAPI.ObjectType.KNIFE)
end

---@deprecated
---@param itemID integer
function UniqueItemsAPI.IsItemRegistered(itemID)
	--return UniqueItemsAPI.IsObjectRegistered(itemID, UniqueItemsAPI.ObjectType.FAMILIAR)
end

---@deprecated
---@param familiarVariant FamiliarVariant
function UniqueItemsAPI.IsFamiliarRegistered(familiarVariant)
	--return UniqueItemsAPI.IsObjectRegistered(familiarVariant, UniqueItemsAPI.ObjectType.FAMILIAR)
end

---@deprecated
---@param knifeVariant KnifeVariant
function UniqueItemsAPI.IsKnifeRegistered(knifeVariant)
	--return UniqueItemsAPI.IsObjectRegistered(knifeVariant, UniqueItemsAPI.ObjectType.KNIFE)
end

---@param spritePath string[] | string
---@return string | string[], boolean
local function manageSpritePath(spritePath)
	if type(spritePath) == "table" then
		return spritePath, false
	elseif string.find(spritePath, ".anm2") then
		return spritePath, true
	else
		return { spritePath }, false
	end
end

---@deprecated
---@param params OldObjectParams
function UniqueItemsAPI.AddCharacterItem(params)
	params.ObjectID = params.ItemID
	local spritePath, isAnm2 = manageSpritePath(params.ItemSprite)
	if isAnm2 then
		---@cast spritePath string
		params.Anm2 = spritePath
	else
		---@cast spritePath string[]
		params.SpritePath = spritePath
	end
	params.DisableByDefault = params.DisabledOnFirstLoad
	UniqueItemsAPI.AssignUniqueObject(params, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param params OldObjectParams
function UniqueItemsAPI.AddCharacterFamiliar(params)
	params.ObjectID = params.FamiliarVariant
	local spritePath, isAnm2 = manageSpritePath(params.FamiliarSprite)
	if isAnm2 then
		---@cast spritePath string
		params.Anm2 = spritePath
	else
		---@cast spritePath string[]
		params.SpritePath = spritePath
	end
	UniqueItemsAPI.AssignUniqueObject(params, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param params OldObjectParams
function UniqueItemsAPI.AddCharacterKnife(params)
	params.ObjectID = params.KnifeVariant
	local spritePath, isAnm2 = manageSpritePath(params.KnifeSprite)
	if isAnm2 then
		---@cast spritePath string
		params.Anm2 = spritePath
	else
		---@cast spritePath string[]
		params.SpritePath = spritePath
	end
	UniqueItemsAPI.AssignUniqueObject(params, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param modifierName string
---@param funcCondition function
---@param funcCallback function
function UniqueItemsAPI.AddItemModifier(modifierName, funcCondition, funcCallback)
	UniqueItemsAPI.AddObjectModifier(modifierName, funcCondition, funcCallback, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param modifierName string
---@param funcCondition function
---@param funcCallback function
function UniqueItemsAPI.AddFamiliarModifier(modifierName, funcCondition, funcCallback)
	UniqueItemsAPI.AddObjectModifier(modifierName, funcCondition, funcCallback, UniqueItemsAPI.ObjectType.FAMILIAR)
end

---@deprecated
---@param modifierName string
---@param funcCondition function
---@param funcCallback function
function UniqueItemsAPI.AddKnifeModifier(modifierName, funcCondition, funcCallback)
	UniqueItemsAPI.AddObjectModifier(modifierName, funcCondition, funcCallback, UniqueItemsAPI.ObjectType.KNIFE)
end

---@deprecated
---@param modifierName string
function UniqueItemsAPI.RemoveItemModifier(modifierName)
	UniqueItemsAPI.RemoveObjectModifier(modifierName, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param modifierName string
function UniqueItemsAPI.RemoveFamiliarModifier(modifierName)
	UniqueItemsAPI.RemoveObjectModifier(modifierName, UniqueItemsAPI.ObjectType.FAMILIAR)
end

---@deprecated
---@param modifierName string
function UniqueItemsAPI.RemoveKnifeModifier(modifierName)
	UniqueItemsAPI.RemoveObjectModifier(modifierName, UniqueItemsAPI.ObjectType.KNIFE)
end

---@deprecated
---@param itemID CollectibleType
---@param player EntityPlayer | PlayerType
---@param noModifier? boolean
---@return UniqueObjectParams | nil
function UniqueItemsAPI.GetItemParams(itemID, player, noModifier)
	local params = UniqueItemsAPI.GetObjectParams(itemID, player, noModifier, UniqueItemsAPI.ObjectType.ITEM)
	---@cast params OldObjectParams
	if params then
		params.ItemID = params.ObjectID
		params.ItemSprite = params.SpritePath or params.Anm2
	end
	return params
end

---@deprecated
---@param familiarVariant FamiliarVariant
---@param familiar EntityFamiliar | EntityPlayer | PlayerType
---@param noModifier? boolean
---@return UniqueObjectParams | nil
function UniqueItemsAPI.GetFamiliarParams(familiarVariant, familiar, noModifier)
	local params = UniqueItemsAPI.GetObjectParams(familiarVariant, familiar, noModifier,
		UniqueItemsAPI.ObjectType.FAMILIAR)
	---@cast params OldObjectParams
	if params then
		params.FamiliarVariant = params.ObjectID
		params.FamiliarSprite = params.SpritePath or params.Anm2
	end
	return params
end

---@deprecated
---@param knifeVariant KnifeVariant
---@param knife EntityKnife | EntityPlayer | PlayerType
---@param noModifier? boolean
---@return UniqueObjectParams | nil
function UniqueItemsAPI.GetKnifeParams(knifeVariant, knife, noModifier)
	local params = UniqueItemsAPI.GetObjectParams(knifeVariant, knife, noModifier, UniqueItemsAPI.ObjectType.KNIFE)
	---@cast params OldObjectParams
	if params then
		params.KnifeVariant = params.ObjectID
		params.KnifeSprite = params.SpritePath or params.Anm2
	end
	return params
end

---@deprecated
---@param itemID CollectibleType
---@param playerType PlayerType
function UniqueItemsAPI.GetCurrentItemMod(itemID, playerType)
	UniqueItemsAPI.GetCurrentObjectMod(itemID, playerType, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param familiarVariant FamiliarVariant
---@param playerType PlayerType
function UniqueItemsAPI.GetCurrentFamiliarMod(familiarVariant, playerType)
	UniqueItemsAPI.GetCurrentObjectMod(familiarVariant, playerType, UniqueItemsAPI.ObjectType.FAMILIAR)
end

---@deprecated
---@param knifeVariant KnifeVariant
---@param playerType PlayerType
function UniqueItemsAPI.GetCurrentKnifeMod(knifeVariant, playerType)
	UniqueItemsAPI.GetCurrentObjectMod(knifeVariant, playerType, UniqueItemsAPI.ObjectType.KNIFE)
end

---@deprecated
---@param itemID CollectibleType
---@param playerType PlayerType
---@param bool boolean
function UniqueItemsAPI.ToggleCharacterItem(itemID, playerType, bool)
	UniqueItemsAPI.ToggleCharacterObject(itemID, playerType, bool, UniqueItemsAPI.ObjectType.ITEM)
end

---@deprecated
---@param familiarVariant FamiliarVariant
---@param playerType PlayerType
---@param bool boolean
function UniqueItemsAPI.ToggleCharacterFamiliar(familiarVariant, playerType, bool)
	UniqueItemsAPI.ToggleCharacterObject(familiarVariant, playerType, bool, UniqueItemsAPI.ObjectType.FAMILIAR)
end

---@deprecated
---@param knifeVariant KnifeVariant
---@param playerType PlayerType
---@param bool boolean
function UniqueItemsAPI.ToggleCharacterKnife(knifeVariant, playerType, bool)
	UniqueItemsAPI.ToggleCharacterObject(knifeVariant, playerType, bool, UniqueItemsAPI.ObjectType.FAMILIAR)
end

--#endregion