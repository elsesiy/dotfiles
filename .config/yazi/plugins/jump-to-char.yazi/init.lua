-- source: https://github.com/yazi-rs/plugins/blob/ac88ed352aa02730fdf6fdc5f064676de78b56d8/jump-to-char.yazi/init.lua
local AVAILABLE_CHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

local changed = ya.sync(function(st, new)
	local b = st.last ~= new
	st.last = new
	return b
end)

return {
	entry = function()
		local cands = {}
		for i = 1, #AVAILABLE_CHARS do
			cands[#cands + 1] = { on = AVAILABLE_CHARS:sub(i, i) }
		end

		local idx = ya.which { cands = cands, silent = true }
		if not idx then
			return
		end

		if changed(cands[idx].on) then
			ya.manager_emit("find_do", { "^" .. cands[idx].on })
		else
			ya.manager_emit("find_arrow", {})
		end
	end,
}
