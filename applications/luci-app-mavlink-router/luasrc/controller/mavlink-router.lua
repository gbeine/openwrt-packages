module("luci.controller.mavlink-router", package.seeall)

local util  = require("luci.util")
local i18n  = require("luci.i18n")
local templ = require("luci.template")
local http  = require("luci.http")

function index()
	if not nixio.fs.access("/etc/config/mavlink-router") then
		nixio.fs.writefile("/etc/config/mavlink-router", "")
	end

	entry({"admin", "services", "mavlink-router"}, firstchild(), _("MAVLink Router"), 60).dependent = false
	entry({"admin", "services", "mavlink-router", "overview"}, cbi("mavlink-router"), _("Overview"), 10).leaf = true
	entry({"admin", "services", "mavlink-router", "log"}, template("mavlink-router/logread"), _("Logs"), 30).leaf = true

	entry({"admin", "services", "mavlink-router", "logread"}, call("logread"), nil).leaf = true

end

function logread()
	local content = ""
	if content == "" then
		content = "No MAVLink Router logs yet!"
	end
	http.write(content)
end

