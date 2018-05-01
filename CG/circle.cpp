#include <iostream>
#include <GL/glut.h>
using namespace std;

int xc, yc, r;

void plot(int x, int y) {
  glBegin(GL_POINTS);
  glVertex2i(x + xc, y + yc);
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

void circleAlgo()
{
    int x = 0, y = r;

    int D = 1 - r;
    while (y > x)
    {
        plot(x, y);
        plot(-x, y);
        plot(x, -y);
        plot(-x, -y);
        plot(y, x);
        plot(-y, x);
        plot(y, -x);
        plot(-y, -x);

        if (D < 0)
            D = D + 2*x + 3;
        else
        {
            D = D + 2*x - 2*y + 5;
            y--;
        }
        x++;
    }
}

void myDisplay(void) {
  glClear(GL_COLOR_BUFFER_BIT);
  glColor3f(0.0, 0.0, 0.0);
  glPointSize(1.0);

  circleAlgo();

  glFlush();
}

int main(int argc, char **argv) {
  cout << "Enter the coordinates of the center and radius of the circle:\n\n" << endl;

  cout << "X-Center coordinate   : ";
  cin >> xc;
  cout << "\nY-Center coordinate : ";
  cin >> yc;
  cout << "\nRadius : ";
  cin >> r;

  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
  glutInitWindowSize(640, 480);
  glutInitWindowPosition(100, 150);
  glutCreateWindow("Circle Alogrithm");
  glutDisplayFunc(myDisplay);
  myInit();
  glutMainLoop();
  return 0;
}
