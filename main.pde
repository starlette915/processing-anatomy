int e1x = 0;

void setup() {
  size(200, 200);
  background(100);
  stroke(255);
  ellipse(50, 50, 25, 25);
  println("hello web!");
}

void draw() {
  fill("#aacc99")
  ellipse(e1x, height * 1/5, d, d);
  e1x += 1;
  e1x = constrain(e1x, 0, 550);
}
