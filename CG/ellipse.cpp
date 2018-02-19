#include <GL/glut.h>
#include <iostream>
#include <stdio.h>
using namespace std;

int xc, yc, a, b;

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

void ellipseAlgo() {	

	int x = 0, y = b;
	int aSq = a*a;
	int bSq = b*b;
	double d1 = bSq - (aSq*b) + (0.25 * aSq);

	cout << a << " : " << b <<endl;

	plot(x, y);
	plot(-x, y);
	plot(x, -y);
	plot(-x, -y);

	while(aSq*(y - 0.5) > bSq*(x+1)){

		if(d1 < 0)
			d1 += bSq*(2*x + 3);
		else{
			d1 += bSq*(2*x + 3) + aSq*(-2*y + 2);
			y--;
		}
		x++;
		plot(x, y);
		plot(-x, y);
		plot(x, -y);
		plot(-x, -y);
	}
	
	double d2 = bSq*(x + 0.5)*(x + 0.5) + aSq*(y-1)*(y-1) - aSq*bSq;
	while(y > 0){
		if(d2 < 0){
			d2 += bSq*(2*x+2) + aSq*(-2*y + 3);
			x++;
		}else{
			d2 += aSq*(-2*y + 3);
		}
		y--;
		plot(x, y);
		plot(-x, y);
		plot(x, -y);
		plot(-x, -y);
	}

}

void myDisplay(void) {
  glClear(GL_COLOR_BUFFER_BIT);
  glColor3f(0.0, 0.0, 0.0);
  glPointSize(1.0);

  ellipseAlgo();

  glFlush();
}

int main(int argc, char **argv) {
  cout << "Enter the coordinates of the Line:\n\n" << endl;

  cout << "XCenter-coordinate   : ";
  cin >> xc;
  cout << "\nYCenter-coordinate : ";
  cin >> yc;
  cout << "\nMajor Axis Length : ";
  cin >> a;
  cout << "\nMajor Axis Length : ";
  cin >> b;

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
