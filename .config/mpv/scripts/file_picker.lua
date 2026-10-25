local mp = require("mp")

local function open_picker()
  mp.command_native_async({
    name = "subprocess",
    args = {
      "zenity",
      "--file-selection",
      "--multiple",
      "--separator=\n",
      "--title=Add to mpv playlist"
    },
    capture_stdout = true
  }, function(success, result)
    if not success or result.status ~= 0 then
      return
    end

    for file in result.stdout:gmatch("[^\r\n]+") do
      mp.commandv("loadfile", file, "append")
    end
  end)
end

mp.add_key_binding(nil, "open-file-picker", open_picker)
