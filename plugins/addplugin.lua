local function run(msg, matches)
 local text = matches[2]
 if matches[1] == "addplugin" then
  return text
 else
  local file = io.open("./plugins/"..matches[1], "w")
  file:write(text)
  file:flush()
  file:close()
  return send_document("channel#id"..msg.to.id,"./plugins/"..matches[1], ok_cb, false)
 end
end

return {
 description = "Simplest plugin ever!",
 usage = {
  "!plug [text] : return text",
  "plug> [ext] [text] : save text to file",
 },
 patterns = {
  "^[!/](addplugin) (.*)$",
  "^[Aa]ddplugin> ([^%s]+) (.*)$",
 },
 run = run,
privileged = true,
}
