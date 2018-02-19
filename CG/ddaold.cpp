#include <GL/glut.h>
#include <iostream>
#include <stdio.h>
#include <math.h>
using namespace std;

int x1, yr, x2, y2;

void plot(int x, int y) {
  glBegin(GL_POINTS);
  glVertex2i(x, y);
  glEnd();
}

void myInit(void) {
  glClearColor(1.0, 1.0, 1.0, 0.0);
  glColor3f(0.0f, 0.0f, 0.0f);
  glPointSize(4.0);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  gluOrtho2D(0.0, 640.0, 0.0, 480.0);
}
void ddaAlgo() {
<<<<<<< HEAD
  int dx = x2 - x1;
  int dy = y2 - y1;

  int m = (y2 - y1) / (x2 - x1);

  if (m <= 1 && -1 <= m) {

    if (xi > x2) {
    }
    while (xi != x2) {

      plot(xi, yi);

      xi = xi + 1;
      yi = yi + m;
    }

  } else {

    while (yi != y2) {
=======

  int xi = x1, yi = yr;

  double m = (y2-yr)/(x2-x1);

		while(xi != x2){

			plot(xi, yi);

			xi = xi + 1;
			yi = floor(yi + m + 0.5);
>>>>>>> 4401c9851d8de33d2865833815e824dd5fdcca7a

      plot(xi, yi);

<<<<<<< HEAD
      yi = yi + 1;
      xi = xi + m * (xi + 1) / m;
    }
  }
=======
>>>>>>> 4401c9851d8de33d2865833815e824dd5fdcca7a
}

void myDisplay(void) {
  glClear(GL_COLOR_BUFFER_BIT);
  glColor3f(0.0, 0.0, 0.0);
  glPointSize(1.0);

  ddaAlgo();

  glFlush();
}

int main(int argc, char **argv) {
  cout << "Enter the coordinates of the Line:\n\n" << endl;

  cout << "X1-coordinate   : ";
  cin >> x1;
  cout << "\nyr-coordinate : ";
  cin >> yr;
  cout << "\nX2-coordinate   : ";
  cin >> x2;
  cout << "\nY2-coordinate : ";
  cin >> y2;

  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
  glutInitWindowSize(640, 480);
  glutInitWindowPosition(100, 150);
  glutCreateWindow("DDA Alogrithm");
  glutDisplayFunc(myDisplay);
  myInit();
  glutMainLoop();
  return 0;
}
