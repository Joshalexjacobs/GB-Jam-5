return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.16.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 54,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 44,
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
      imagewidth = 128,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 16,
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
      height = 54,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        15, 15, 15, 15, 6, 8, 15, 15, 15, 15,
        8, 6, 6, 8, 8, 8, 8, 8, 7, 8,
        6, 6, 6, 8, 6, 8, 6, 6, 8, 6,
        8, 6, 8, 8, 8, 8, 8, 8, 8, 6,
        7, 5, 8, 8, 8, 8, 6, 6, 8, 6,
        13, 6, 6, 8, 8, 12, 3, 4, 7, 8,
        8, 11, 6, 8, 6, 8, 8, 12, 13, 6,
        10, 8, 6, 7, 8, 6, 6, 14, 9, 6,
        13, 13, 6, 3, 4, 8, 7, 8, 6, 12,
        4, 1, 2, 8, 12, 14, 6, 8, 6, 13,
        10, 13, 8, 8, 6, 8, 6, 8, 8, 1,
        3, 4, 7, 8, 8, 6, 8, 6, 8, 1,
        2, 11, 8, 12, 6, 1, 2, 6, 8, 5,
        13, 14, 6, 9, 6, 8, 5, 6, 13, 1,
        1, 2, 8, 6, 14, 12, 8, 13, 10, 11,
        8, 7, 8, 13, 11, 13, 3, 4, 12, 8,
        6, 9, 6, 6, 6, 8, 6, 6, 6, 7,
        8, 8, 8, 8, 8, 6, 8, 6, 7, 9,
        8, 13, 8, 6, 1, 2, 6, 8, 10, 6,
        6, 7, 7, 6, 6, 8, 8, 6, 8, 6,
        8, 6, 6, 6, 6, 13, 6, 8, 8, 9,
        2, 8, 7, 6, 8, 6, 8, 7, 8, 6,
        9, 8, 6, 8, 8, 6, 8, 8, 8, 6,
        8, 6, 13, 6, 8, 6, 8, 6, 6, 8,
        8, 8, 6, 8, 8, 6, 8, 3, 4, 8,
        6, 7, 8, 6, 6, 6, 8, 8, 8, 6,
        6, 5, 8, 8, 8, 8, 8, 8, 11, 14,
        8, 6, 6, 6, 6, 6, 8, 13, 12, 8,
        6, 10, 6, 8, 6, 6, 6, 6, 6, 7,
        1, 2, 8, 6, 6, 6, 8, 6, 6, 8,
        8, 8, 7, 8, 6, 6, 6, 6, 8, 8,
        6, 8, 6, 7, 8, 6, 6, 6, 8, 6,
        6, 6, 6, 6, 8, 6, 7, 8, 6, 6,
        8, 7, 6, 8, 6, 6, 8, 8, 8, 7,
        6, 6, 6, 6, 8, 6, 8, 8, 8, 8,
        6, 8, 8, 6, 6, 8, 8, 6, 8, 7,
        11, 8, 8, 6, 8, 8, 8, 7, 6, 6,
        6, 6, 8, 6, 6, 7, 8, 8, 8, 8,
        8, 7, 6, 6, 6, 8, 8, 8, 6, 6,
        6, 8, 6, 8, 8, 8, 8, 6, 8, 10,
        10, 8, 8, 8, 6, 6, 6, 8, 8, 6,
        8, 8, 8, 8, 7, 6, 8, 8, 8, 1,
        8, 8, 8, 6, 6, 6, 8, 8, 8, 9,
        6, 8, 7, 6, 6, 8, 8, 6, 10, 6,
        8, 8, 6, 6, 8, 6, 8, 6, 6, 7,
        8, 8, 8, 8, 8, 6, 6, 8, 6, 8,
        6, 6, 7, 13, 6, 6, 6, 8, 7, 8,
        6, 8, 6, 8, 6, 8, 8, 8, 8, 8,
        7, 8, 6, 8, 6, 6, 7, 6, 8, 8
      }
    },
    {
      type = "objectgroup",
      name = "Object Layer 1",
      visible = true,
      opacity = 0,
      offsetx = -0.168279,
      offsety = 1.13687e-13,
      properties = {},
      objects = {
        {
          id = 1,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 131.25,
          y = 770.2,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 2,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 147.186,
          y = 707.103,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 3,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 3.40807,
          y = 723.04,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 4,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 19,
          y = 530.374,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 5,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 131.25,
          y = 370.901,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 6,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 131.25,
          y = 306.439,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 7,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 3.40807,
          y = 242.818,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 8,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 3.25,
          y = 194.332,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 9,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 145.957,
          y = 754.316,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 10,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 1.75,
          y = 434.242,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 11,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 145.504,
          y = 402.291,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 12,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 145.504,
          y = 353.525,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 13,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 17.5,
          y = 338.39,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 14,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 49.6525,
          y = 290.184,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 15,
          name = "big shroom",
          type = "block",
          shape = "rectangle",
          x = 129.809,
          y = 194.332,
          width = 10,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 16,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 0.728817,
          y = 544.563,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 17,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 0.728817,
          y = 657.231,
          width = 13.1726,
          height = 12.6121,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 18,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 144.899,
          y = 736.407,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 19,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 128.924,
          y = 497.057,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 20,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 112.388,
          y = 464.826,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 21,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = -14.574,
          y = 416.62,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 22,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 65.0224,
          y = 369.254,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 23,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 81.278,
          y = 272.842,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 24,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 17.5168,
          y = 498.178,
          width = 13.1726,
          height = 12.6121,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 25,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 129.905,
          y = 514.714,
          width = 13.1726,
          height = 12.6121,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 26,
          name = "wall1",
          type = "block",
          shape = "rectangle",
          x = 96.3665,
          y = 318.946,
          width = 46.1784,
          height = 15.1345,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 27,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 63.6211,
          y = 304.793,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 28,
          name = "wall2",
          type = "block",
          shape = "rectangle",
          x = 0.840786,
          y = 256.446,
          width = 30.2691,
          height = 63.2007,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 29,
          name = "wall3",
          type = "block",
          shape = "rectangle",
          x = -1.68164,
          y = 224.215,
          width = 48.9351,
          height = 14.2237,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 30,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 65.3027,
          y = 225.196,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 31,
          name = "big rock",
          type = "block",
          shape = "rectangle",
          x = 48.4865,
          y = 208.941,
          width = 30.2691,
          height = 13.7332,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 32,
          name = "wall4",
          type = "block",
          shape = "rectangle",
          x = 80.6055,
          y = 160.489,
          width = 46.5247,
          height = 14.2237,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 33,
          name = "wall5",
          type = "block",
          shape = "rectangle",
          x = 143.217,
          y = 240.751,
          width = 30.2691,
          height = 77.8447,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 34,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 145.88,
          y = 210.902,
          width = 13.1726,
          height = 12.6121,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 35,
          name = "wall6",
          type = "block",
          shape = "rectangle",
          x = 112.528,
          y = 178.812,
          width = 14.8824,
          height = 26.7657,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 36,
          name = "small rock",
          type = "block",
          shape = "rectangle",
          x = 19.7871,
          y = 176.289,
          width = 10.37,
          height = 10.9305,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 37,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 16.1155,
          y = 145.88,
          width = 16.2837,
          height = 11.9114,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 38,
          name = "wall7",
          type = "block",
          shape = "rectangle",
          x = -0.857836,
          y = 79.3162,
          width = 65.1795,
          height = 12.8924,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 39,
          name = "wall8",
          type = "block",
          shape = "rectangle",
          x = 95.9922,
          y = 79.5239,
          width = 65.0195,
          height = 12.8264,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 41,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 64.7287,
          y = 321.794,
          width = 13.1726,
          height = 12.6121,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 42,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 96.0252,
          y = 290.241,
          width = 16.5027,
          height = 12.6121,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        },
        {
          id = 43,
          name = "med rock",
          type = "block",
          shape = "rectangle",
          x = 49.5935,
          y = 275.619,
          width = 13.1726,
          height = 12.6121,
          rotation = 0,
          visible = true,
          properties = {
            ["collidable"] = true
          }
        }
      }
    }
  }
}
