import java.util.Vector;

Vector path;
int lastX = -1, lastY = -1;
color drawColor = color(228,76,76);
color traceColor = color(76,228,89);
int traceCountdown = 0;

class Point {
  public int x, y;
  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

void setup() {
  size(640,480);
  background(255);
  path = new Vector();
}

void draw() {
  if(mousePressed) {
    strokeWeight(1);
    stroke(drawColor);
    if(lastX != -1)
      line(lastX, lastY, mouseX, mouseY);
    lastX = mouseX;
    lastY = mouseY;
    path.add(new Point(mouseX,mouseY));
  } else {
    lastX = lastY = -1;
    if(path.size() > 1) {
      if(traceCountdown == 0) {
        strokeWeight(4);
        stroke(traceColor);
        Point p1 = (Point) path.remove(0);
        Point p2 = (Point) path.get(0);
        line(p1.x, p1.y, p2.x, p2.y);
        traceCountdown = 2;
      } else {
        traceCountdown--;
      }
    } else {
      path = new Vector();
    }
  }
}

void keyPressed() {
  background(255);
  path = new Vector();
  lastX = -1;
  lastY = -1;
}
