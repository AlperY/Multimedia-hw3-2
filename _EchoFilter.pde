public class EchoFilter implements AudioEffect {
 
  int sdelay;
  CyclicBuffer buffer;
  
  EchoFilter (float sampleRate, float tdelay) {
    sdelay = (int) floor(sampleRate * tdelay * 2);
    buffer = new CyclicBuffer(sdelay);
  }
  
  public void process (float[] signal) {
    //float[] signaal = new float[signal.length];
    for (int i = 0; i < signal.length; i++) {
      buffer.addSample(signal[i]);
      signal[i] = (buffer.getSample(-1) + signal[i])/2;
    }
    
   // arraycopy(signaal, signal);
    
  }
  
  public void process (float[] left, float[] right) {
    process(left);
    process(right);
  }
  
}
  

