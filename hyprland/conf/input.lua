-- --- Input (ported from the sway "input" blocks) ---

hl.config({
    input = {
        kb_layout = "us",
        repeat_delay = 250,
        repeat_rate = 35,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            scroll_factor = 0.3,
            tap_to_click = true,
        },
    },
})

-- Elantech touchpad, same settings as the type:touchpad block
hl.device({ name = "2:14:ETPS/2_Elantech_Touchpad", natural_scroll = true, disable_while_typing = true, scroll_factor = 0.3 })

-- Wacom finger input disabled
hl.device({ name = "1386:21018:Wacom_HID_521A_Finger", enabled = false })

-- HP mouse: sway pointer_accel -0.8 becomes sensitivity -0.8
hl.device({ name = "pointer:hp-mouse", sensitivity = -0.8 })
