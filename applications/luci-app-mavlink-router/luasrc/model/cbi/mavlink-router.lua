
m = Map("mavlink-router", translate("MAVLink Router"), 
    [[mavlinkrouter - /etc/mavlink-router/main.conf]])

-- general section and command line arguments

s = m:section(TypedSection, "general", translate("General"))
s.anonymous = true

port = s:option(Value, "port", translate("TCP Port"))
port.datatype = "port"
port.default = "5790"
port.optional = false
port.rmempty = false

stats = s:option(Flag, "stats", translate("Report statistics"))
stats.rmempty = false

dialect = s:option(ListValue, "dialect", translate("MAVLink dialect"))
dialect:value("auto", "auto")
dialect:value("common", "common")
dialect:value("ardupilotmega", "ardupilotmega")
dialect.default = "auto"

log_dir = s:option(Value, "log_dir", translate("Log directory"))
log_dir.default = "/var/log/mavlink-router"
log_dir.optional = false
log_dir.rmempty = false

log_mode = s:option(ListValue, "log_mode", translate("Log mode"))
log_mode:value("always", "always")
log_mode:value("while-armed", "while-armed")
log_mode.default = "always"

log_level = s:option(ListValue, "log_level", translate("Log level"))
log_level:value("error", "error")
log_level:value("warning", "warning")
log_level:value("info", "info")
log_level:value("debug", "debug")
log_level.default = "info"

master = s:option(ListValue, "master", translate("Master"))
master:value("uart", "uart")
master:value("udp", "udp")
master.default = "uart"

device = s:option(Value, "device", "Master device")
device:depends("master", "uart")
device.datatype = "device"
device.default = "/dev/ttyS0"

baud = s:option(ListValue, "baud", translate("Master baud rate"))
baud:depends("master", "uart")
baud:value("300", "300")
baud:value("600", "600")
baud:value("1200", "1200")
baud:value("1800", "1800")
baud:value("2400", "2400")
baud:value("3600", "3600")
baud:value("4800", "4800")
baud:value("7200", "7200")
baud:value("9600", "9600")
baud:value("14400", "14400")
baud:value("19200", "19200")
baud:value("28800", "28800")
baud:value("38400", "38400")
baud:value("57600", "57600")
baud:value("115200", "115200")
baud:value("230400", "230400")
baud.default = "9600"

address = s:option(Value, "address", "Master IP address")
address:depends("master", "udp")
address.datatype = "ip4addr"
address.default = "0.0.0.0"

mport = s:option(Value, "mport", translate("Master UDP port"))
mport:depends("master", "udp")
mport.datatype = "port"
mport.default = "24550"

-- configuration for UART endpoints

s = m:section(TypedSection, "uartendpoint", translate("UART endpoint"))
s.anonymous = true
s.addremove = true

name = s:option(Value, "name", "Endpoint name")
name.default = "Change me!"
name.optional = false
name.rmempty = false
function name:validate(value)
	return value:match("[0-9A-Za-z]+")
end

device = s:option(Value, "device", "Endpoint device")
device.datatype = "device"
device.default = "/dev/ttyS0"
device.optional = false
device.rmempty = false

baud = s:option(ListValue, "baud", translate("Baud rate"))
baud:value("300", "300")
baud:value("600", "600")
baud:value("1200", "1200")
baud:value("1800", "1800")
baud:value("2400", "2400")
baud:value("3600", "3600")
baud:value("4800", "4800")
baud:value("7200", "7200")
baud:value("9600", "9600")
baud:value("14400", "14400")
baud:value("19200", "19200")
baud:value("28800", "28800")
baud:value("38400", "38400")
baud:value("57600", "57600")
baud:value("115200", "115200")
baud:value("230400", "230400")
baud.default = "9600"

flow = s:option(Flag, "flow", translate("Flow control"))
flow.rmempty = false

-- configuration for UDP endpoints

s = m:section(TypedSection, "udpendpoint", translate("UDP endpoint"))
s.anonymous = true
s.addremove = true

name = s:option(Value, "name", "Endpoint name")
name.default = "Change me!"
name.optional = false
name.rmempty = false
function name:validate(value)
	return value:match("[0-9A-Za-z]+")
end

address = s:option(Value, "address", "Endpoint IP address")
address.datatype = "ip4addr"
address.optional = false
address.rmempty = false

port = s:option(Value, "port", translate("Port"))
port.datatype = "port"
port.default = "14550"
port.optional = false
port.rmempty = false

mode = s:option(ListValue, "mode", translate("Mode"))
mode:value("normal", "normal")
mode:value("eavesdropping", "eavesdropping")
mode.default = "normal"

-- configuration for TCP endpoints

s = m:section(TypedSection, "tcpendpoint", translate("TCP endpoint"))
s.anonymous = true
s.addremove = true

name = s:option(Value, "name", "Endpoint name")
name.default = "Change me!"
name.optional = false
name.rmempty = false
function name:validate(value)
	return value:match("[0-9A-Za-z]+")
end

address = s:option(Value, "address", "Endpoint IP address")
address.datatype = "ip4addr"
address.optional = false
address.rmempty = false

port = s:option(Value, "port", translate("Port"))
port.datatype = "port"
port.optional = false
port.rmempty = false

retry = s:option(Value, "retry", translate("Retry timeout"))
retry.datatype = "uinteger"
retry.default = "5"

return m
