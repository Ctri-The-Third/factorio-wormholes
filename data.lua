
require("data.spacelocation-wormhole")
require("data.connection-nauviswormhole")
require("data.technology-wormholediscovery")
require("data.ui-styles")

local fireArmour = table.deepcopy(data.raw["armor"]["heavy-armor"])


fireArmour.name = "fire-armour"
fireArmour.icons = {
    {
        icon = fireArmour.icon,
        icon_size = fireArmour.icon_size,
        tint = {r=1, g=0, b=0, a=0.3}
    },
}



fireArmour.resistances = {
  {
    type = "physical",
    decrease = 6,
    percent = 10
  },
  {
    type = "explosion",
    decrease = 10,
    percent = 30
  },
  {
    type = "acid",
    decrease = 5,
    percent = 30
  },
  {
    type = "fire",
    decrease = 0,
    percent = 100
  }
}

local recipe = {
    type = "recipe",
    name="fire-armour",
    enabled=true,
    energy_required = 8,
    ingredients = {
        {type="item", name = "copper-plate", amount = 200},
        {type="item", name = "steel-plate", amount = 50}
    },
    results = {{type="item", name="fire-armour",amount=1}}


}



data:extend{fireArmour, recipe}