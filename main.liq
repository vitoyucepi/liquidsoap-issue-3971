settings.init.allow_root := true

s = playlist("1.cue", loop=false, mode="normal", prefetch=2)

# s = clock(sync="none", s)
# clock.assign_new(sync="none", [s])

enc = %ffmpeg(format="mp3", %audio(codec="libmp3lame", b="128k"))
output.file(enc, "out.mp3", s, fallible=true)

thread.run(shutdown, delay=5.)
