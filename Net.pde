int colorA = color(20, 89, 90);
int colorB = color(255, 23, 85);


int nDots = 20;
PVector[] dots;

void setup () {
  size(1000, 1000);

  dots = new PVector[nDots]; 
  for (int i = 0; i < nDots; i++) {
    dots[i] = new PVector(random(0, width), random(0, height));
  }

  noStroke();
}

void draw () {
  background(0);
  updateDots();
  renderDots();
}

void updateDots() {


  for (int i = 0; i < nDots; i++) {
    PVector offset = new PVector(random(-3, 3), random(-3, 3));
    dots[i].add(offset);

    if (dots[i].x < 0) { 
      dots[i].x = width;
    }
    if (dots[i].x > width) { 
      dots[i].x = 0;
    }
    if (dots[i].y < 0) { 
      dots[i].y = height;
    }
    if (dots[i].y > height) { 
      dots[i].y = 0;
    }
  }
}

void renderDots() {
  noStroke();
  for (int i = 0; i < nDots; i++) {
    fill(colorA);
    ellipse(dots[i].x, dots[i].y, 6, 6);

    fill(colorB, 100);
    ellipse(dots[i].x, dots[i].y, 33, 33);
  }
 

     stroke(255);
    for (int i = 0; i < nDots; i++) {
      for (int j = i + 1; j < nDots; j++) {
        float d = dist(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
        if (d <= 100) {
          line(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
        }
      }
    }
  }
