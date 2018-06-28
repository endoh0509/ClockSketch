import controlP5.*;

int h, m, s;
SpringShape sSpringShape;

void setup() {
  size(800, 800);
  h = hour();
  m = minute();
  s = second();
  PVector[] vertices = new PVector[60];
  for (int i = 0; i < 60; i++) {
    float ang = map(i, 0, 60 - 1, 0, PI * 2);
    float rad = 100;
    float x = cos(ang) * rad;
    float y = sin(ang) * rad;
    vertices[i] = new PVector(x, y);
  }
  sSpringShape = new SpringShape(vertices);
  sSpringShape.setCenter(new PVector(width / 2, height / 2));
}

void draw() {
  background(0);
  sSpringShape.update();
  sSpringShape.draw();

  if (s != second()) baribariSecond();
  
  debugSecond();
}

void baribariSecond() {
  s = second();
  for (int i = 0; i <sSpringShape. getVerticesLength(); i++) {
    float rad = map(i, 0, 59, 0, PI * 2);
    PVector speed = new PVector(cos(rad), sin(rad));
    speed.mult(i % 2 == 0 ? 1 : -1);
    speed.mult(abs((i - 30)) - s);
    sSpringShape.addVelocity(i, speed);
  }
}

void debugSecond() {
  float rad = map(second(), 0, 59, 0, PI * 2);
  float x = cos(rad) * 100;
  float y = sin(rad) * 100;
  line(width / 2, height / 2, width / 2 + x, height / 2 + y);
}