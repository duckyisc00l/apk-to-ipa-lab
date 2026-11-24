function love.conf(t) t.window.title = "textprobe"; t.window.highdpi = true; t.modules.audio = false; t.modules.sound = false end  -- no audio: CoreAudio deadlocks on some CI simulators
