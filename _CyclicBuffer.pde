class CyclicBuffer {

  private float[] buffer;
  private int pos;
  
  CyclicBuffer(int len) {
    buffer = new float[len];
  }
  
  public void addSample(float v) {
    pos = ++pos % buffer.length;
    buffer[pos] = v;
  }
  
  public float getSample(int i) {
    while (pos-i < 0) {
      i -= buffer.length;
    }
    return buffer[(pos-i) % buffer.length];
  }
}
