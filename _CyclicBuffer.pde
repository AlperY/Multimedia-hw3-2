import java.util.Arrays;

class CyclicBuffer {

  private float[] buffer;
  private int pos;
  
  CyclicBuffer(int len) {
    buffer = new float[len];
  }
  
  public void addSample(float v) {
    buffer[pos++] = v;
    pos = pos % buffer.length;
  }
  
  public float getSample(int i) {

   while (pos-i-1 < 0) {
      i -= buffer.length;
   }
   return buffer[(pos-i-1) % buffer.length];
  }
}
