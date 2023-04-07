rec:
	yes | ffmpeg -f avfoundation -i ":1" audio/mp3/audiocapture.mp3
convert:
	yes | ffmpeg -i audio/mp3/audiocapture.mp3 -ar 16000 audio/wav/audiocapture.wav
lan_auto:
	./whisper.cpp/main -m whisper.cpp/models/ggml-large.bin -f audio/wav/audiocapture.wav -nt -l auto
lan_en:
	./whisper.cpp/main -m whisper.cpp/models/ggml-large.bin -f audio/wav/audiocapture.wav -nt
tra:
	make convert && make lan_auto
auto:
	make convert && make lan_auto
en:
	make convert && make lan_en
