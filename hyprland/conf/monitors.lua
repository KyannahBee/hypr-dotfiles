-- --- Monitors (ported from the sway "output" rules) ---
-- "preferred" keeps the native mode where sway set no mode.
-- vrr = 1 ports sway's "adaptive_sync on".

-- Internal monitor
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1.25, vrr = 1 })

-- HDMI
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "1536x0", scale = 1.25, vrr = 1 })

-- AOC at kot: 1st=left, 2nd=under
hl.monitor({ output = "AOC Q24P2W1 HCMN2HA007270", mode = "preferred", position = "-2048x-288", scale = 1.25, vrr = 1 })
-- hl.monitor({ output = "AOC Q24P2W1 HCMN2HA007270", mode = "preferred", position = "-256x-1152", scale = 1.25, vrr = 1 })

-- Philips at home
hl.monitor({ output = "Philips Consumer Electronics Company PHL 242B1 UHB2336037517", mode = "1920x1080@74.973", position = "-192x-1080", scale = 1, vrr = 1 })

-- TV appartment
hl.monitor({ output = "Philips Consumer Electronics Company Philips FTV 0x01010101", mode = "preferred", position = "0x-1080", scale = 1, vrr = 1 })

-- LG ULTRAFINE (WATT)
hl.monitor({ output = "LG Electronics LG ULTRAFINE 501NTBK0Z029", mode = "preferred", position = "-512x-1440", scale = 1.5, vrr = 1 })

-- Catch-all: any unregistered screen gets the HDMI rule's scale
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.25, vrr = 1 })
