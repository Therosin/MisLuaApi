ItemSpawnerManager =
{

--[[

Each item category below can either have a "classes" or a "group" table in it.
If it contains a "group", then the spawner will process ALL of the items in the group and attempt to spawn all of them.
Using a group allows you to spawn a group of items at once (like a weapon and ammo for it).
If it contains a "classes" then it will radomly pick just ONE of them to attempt to spawn.

Example:

	category = "RandomAttachments",
	group = -- tries to spawn ALL items below
	{
		{ class = "M40x5", percent = 25.0 }, -- 25% chance this item will be spawned
		{ class = "HuntingScope", percent = 5.0 }, -- 5% chance this item will be spawned
	},

{ class = "SchoolPackGreen", percent = 100 },

The percent can be accurate to 4 decimal places (.001) to make for rare item spawns (one in 1,000), but the categories can be nested,
so you can have for example a 1 in 1,000 chance for a category that has a 1 in 1,000 chance of an item so 1 in 1,000,000 in that case for a really rare spawn

Item Categories can be nested to allow for a great amount of variety when spawning items.

--------------

Item Contents:

To add contents to the storage space for an item when it is spawned you need to tell the storage
category that it has "contents", like this:

	{ class = "RuggedPack", contents="RandomBackpackContents", percent = 25 },

Then, when you define the contents category you can use the optional percent, min, and max attributes like so:

	category = "RandomBackpackContents",
	classes =
	{
		{category = "RandomFood", percent = 15, min = 1, max = 4 },
	},

What the above does is if a "RuggedPack" is spawned then there is a 15% chance that it will spawn with between
1 and 4 "RandomFood" items. A first item is always guaranteed to be spawned, but each successive item's percent is
reduced to 25% of the prior item's, like so:

1st item = 100% to spawn
2nd item = 25% to spawn (if first item spawned)
3rd item = 6.25% to spawn (if second item spawned)
4th item = 1.5625% to spawn (if third item spawned)
...

The level_specific flag only works on a cateogory
If it is set to 1, then it will try and match to the specified category name appended with an underscore and the current level name.
For example, if the current level is islands and the category name is fred, then it would try and find a catgory named fred_islands.
If fred_islands does not exist, then it will use fred_default instead. This allows you to override categoriers at a map level, if desired.

--]]


	itemCategories = {},
}

--------------------------------------------------------------------------
-- Functions called from C++
--------------------------------------------------------------------------
function ItemSpawnerManager:OnInit()
	--Log("ItemSpawnerManager:OnInit");
	self:OnReset();
end

------------------------------------------------------------------------------------------------------
-- OnPropertyChange called only by the editor.
------------------------------------------------------------------------------------------------------
function ItemSpawnerManager:OnPropertyChange()
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnReset called only by the editor.
------------------------------------------------------------------------------------------------------
function ItemSpawnerManager:OnReset()
	--Log("ItemSpawnerManager:OnReset");
	self:Reset();
end

------------------------------------------------------------------------------------------------------
-- OnSpawn called Editor/Game.
------------------------------------------------------------------------------------------------------
function ItemSpawnerManager:OnSpawn()
	self:Reset();
end

function ItemSpawnerManager:Reset()
	--Log("ItemSpawnerManager:Reset");
end

-- Load mods
Script.LoadScriptFolder("scripts/spawners/ism_mods", true, true)