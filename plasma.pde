color palette[];
float t = 0;
void setup() {
  size(200, 200);
  palette = new color[256];
  for(int i = 0; i < palette.length; i++) {
    // palette[i] = (i > 30 && i < 250) ? color(random(255), random(255), random(200)) : color(0);
    palette[i] = color(
      128 + sin(i / 10) * 128,
      64 + sin(i / 2) * 64,
      200 + sin(i) * 155);
  }
}
void draw() {
  loadPixels();
  for(int i = 0; i < pixels.length; i++) {
    pixels[i] = palette[mapColor(
      (radial(i % width / 5, (i / width), width / 2, height / 2, 100 + sin(t) * 10) +
      radial(i % width, i / width, 64 * sin(t / 10) * 30, height / 4, 75 + sin(t / 2) * 10) +
      linear(i % width, 0.5, i / width, 1, 60 + sin(t / 64) * 10)) / 3)];
  }
  updatePixels();
  t += 0.01;
}
int mapColor(float v) {return (int) map(v, -1, 1, 0, palette.length - 1);}
float linear(float x, float xScale, float y, float yScale, float t) {
  return sin((x * xScale + y * yScale) / t);
}
float radial(float x, float y, float cx, float cy, float t) {
  return sin(dist(x, y, cx, cy) / t);
}
