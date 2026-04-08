-- Vim Training Guardrails
-- Forces better vim habits by warning/blocking inefficient motions.

local notify = function(msg)
    vim.notify(msg, vim.log.levels.WARN, { title = "Vim Trainer" })
end

-- ─── State ────────────────────────────────────────────────────────────────────

local COOLDOWN_MS = 2000

local state = { key = nil, count = 0 }
-- cooldown[key] = true means the key is currently blocked
local cooldown = {}

local function track(key)
    if state.key ~= key then
        state.key = key
        state.count = 0
    end
    state.count = state.count + 1
    return state.count
end

local function reset()
    state.key = nil
    state.count = 0
end

local function start_cooldown(key, hint)
    cooldown[key] = true
    notify("BLOQUEADO por " .. (COOLDOWN_MS / 1000) .. "s! Use: " .. hint)
    vim.defer_fn(function()
        cooldown[key] = false
    end, COOLDOWN_MS)
end

-- ─── Guards ───────────────────────────────────────────────────────────────────

local LIMITS = { j = 6, k = 6, h = 4, l = 4 }

local HINTS = {
    j = "} { <C-d> G /{pat} or count+j",
    k = "{ } <C-u> gg ?{pat} or count+k",
    h = "b B F{c} T{c} ^ 0",
    l = "w W f{c} t{c} e $",
}

local function guard(key)
    -- still in cooldown: block and re-notify
    if cooldown[key] then
        notify("BLOQUEADO! Use: " .. HINTS[key])
        return ""
    end

    -- allow explicit count prefix (e.g. 10j)
    if vim.v.count > 0 then
        reset()
        return key
    end

    local n = track(key)
    if n >= LIMITS[key] then
        reset()
        start_cooldown(key, HINTS[key])
        return ""
    end
    return key
end

-- ─── Arrow keys ───────────────────────────────────────────────────────────────

local arrow_hint = {
    ["<Up>"]    = "k  {  <C-u>  gg",
    ["<Down>"]  = "j  }  <C-d>  G",
    ["<Left>"]  = "h  b  B  F{c}  ^",
    ["<Right>"] = "l  w  W  f{c}  $",
}

for arrow, hint in pairs(arrow_hint) do
    -- normal mode: block with hint
    vim.keymap.set("n", arrow, function()
        notify("No arrows! → " .. hint)
    end, { desc = "Training: no arrow keys" })

    -- insert mode: block with hint
    vim.keymap.set("i", arrow, function()
        notify("No arrows in insert! Escape and use: " .. hint)
    end, { desc = "Training: no arrow keys" })

    -- visual mode: block with hint
    vim.keymap.set("v", arrow, function()
        notify("No arrows! → " .. hint)
    end, { desc = "Training: no arrow keys" })
end

-- ─── j / k spam ───────────────────────────────────────────────────────────────

vim.keymap.set("n", "j", function() return guard("j") end,
    { expr = true, desc = "Training: j guard" })

vim.keymap.set("n", "k", function() return guard("k") end,
    { expr = true, desc = "Training: k guard" })

-- ─── h / l spam ───────────────────────────────────────────────────────────────

vim.keymap.set("n", "h", function() return guard("h") end,
    { expr = true, desc = "Training: h guard" })

vim.keymap.set("n", "l", function() return guard("l") end,
    { expr = true, desc = "Training: l guard" })

-- ─── PageUp / PageDown ────────────────────────────────────────────────────────

vim.keymap.set("n", "<PageDown>", function()
    notify("Use <C-d> to scroll down")
end, { desc = "Training: no PageDown" })

vim.keymap.set("n", "<PageUp>", function()
    notify("Use <C-u> to scroll up")
end, { desc = "Training: no PageUp" })

-- ─── Home / End ───────────────────────────────────────────────────────────────

vim.keymap.set({ "n", "i" }, "<Home>", function()
    notify("Use ^ (first non-blank) or 0 (column 0)")
end, { desc = "Training: no Home key" })

vim.keymap.set({ "n", "i" }, "<End>", function()
    notify("Use $ (end of line)")
end, { desc = "Training: no End key" })
