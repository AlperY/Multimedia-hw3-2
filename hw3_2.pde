import ddf.minim.*;

void setup() {
  size(200,200);

  Minim minim = new Minim(this);
  
  AudioPlayer player = minim.loadFile("lvl_eagle.mp3", 16384);
  player.loop();
  AudioEffect echo = new EchoFilter(player.getFormat().getSampleRate(), 10);
  player.addEffect(echo);
}
