public class EchoFilter implements AudioEffect {
 
  CyclicBuffer leftB;
  CyclicBuffer rightB;
  
  EchoFilter (float sampleRate, float tdelay) {
    int sdelay = (int) floor(sampleRate * tdelay);
    leftB = new CyclicBuffer(sdelay);
    rightB = new CyclicBuffer(sdelay);
  }
  
  public void process (float[] signal) {
    for (int i = 0; i < signal.length; i++) {
      leftB.addSample(signal[i]);
      signal[i] = (leftB.getSample(-1) + signal[i])/2;
    }
  }
  
  public void process (float[] left, float[] right) {
    for (int i = 0; i < left.length; i++) {
      leftB.addSample(left[i]);
      left[i] = (leftB.getSample(-1) + left[i])/2;
    }
    for (int i = 0; i < right.length; i++) {
      rightB.addSample(right[i]);
      right[i] = (rightB.getSample(-1) + right[i])/2;
    }
  }
}

