local BFIds = {
  2753915549, --: First Sea
  4442272183, --: Second Sea,
  7449423635 --: Third Sea
}

local isBF = false

for _, BFId in pairs(BFIds) do
  if game.PlaceId == BFId then isBF = true end
end

if isBF == false then return end

local notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/ilovekrabs/alexegei/ong/notificationlib.lua"))()
local credits = notify:made_by_rizz_god_5961()

local notif = {
   ERROR = function(title, description, duration)
      credits:notify(title, description, duration, "Red")
   end,
   WARNING = function(title, description, duration)
      credits:notify(title, description, duration, "Orange")
   end,
   INFO = function(title, description, duration)
      credits:notify(title, description, duration, "Cyan")
   end,
   SUCCESS = function(title, description, duration)
      credits:notify(title, description, duration, "Lime")
   end,
}

setmetatable(notif, {
   __call = function(self, title, description, duration)
     credits:notify(title, description, duration, "Blue")
  end
})

notif("Naple Fruit Finder", "Made by adot.cpp", 1)

local foundFruits = {}

function tpFruit(fruit)
   fruit.Handle.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
end

for i, child in pairs(workspace:GetChildren()) do
   if child:IsA("Tool") and string.find(child.Name, "Fruit") then
      tpFruit(child)

      table.insert(foundFruits, child)
   end
end

if #foundFruits == 0 then
   notif["ERROR"]("ERROR", "No fruits were found :(", 3)
else
   for _, fruit in pairs(foundFruits) do
      notif["SUCCESS"]("SUCCESS", "Found a fruit! " .. fruit.Name, 3)
   end
end
