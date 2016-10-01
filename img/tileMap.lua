return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.16.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 18,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "spritePack",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "spritePack.png",
      imagewidth = 64,
      imageheight = 16,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 4,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 10,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        2, 3, 3, 2, 1, 1, 3, 1, 1, 1,
        1, 1, 1, 3, 3, 3, 3, 3, 2, 1,
        1, 3, 3, 1, 3, 3, 1, 1, 3, 1,
        3, 3, 1, 3, 1, 1, 3, 3, 3, 3,
        3, 1, 1, 1, 3, 3, 2, 1, 3, 1,
        1, 1, 1, 1, 3, 3, 1, 3, 1, 1,
        1, 3, 1, 2, 3, 1, 3, 1, 1, 1,
        1, 1, 3, 3, 3, 1, 1, 1, 3, 3,
        3, 2, 1, 1, 3, 3, 1, 1, 2, 1,
        3, 1, 1, 1, 1, 3, 3, 3, 1, 1,
        3, 3, 2, 3, 3, 1, 3, 3, 1, 1,
        1, 3, 3, 3, 3, 1, 1, 3, 2, 1,
        1, 1, 3, 3, 3, 1, 1, 3, 1, 3,
        3, 1, 3, 1, 2, 1, 1, 3, 1, 1,
        1, 1, 3, 1, 3, 3, 1, 1, 3, 1,
        1, 1, 3, 1, 1, 3, 2, 1, 3, 3,
        1, 1, 3, 1, 3, 3, 1, 1, 3, 2
      }
    }
  }
}
