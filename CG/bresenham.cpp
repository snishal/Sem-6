#include <stdio.h>
#include <iostream>
#include <GL/glut.h>
using namespace std;

int x1, y1, x2, y2;

void plot(int x, int y)
{
	glBegin(GL_POINTS);
	glVertex2i(x, y);
	glEnd();
}


void myInit (void)
{
	glClearColor(1.0, 1.0, 1.0, 0.0);
	glColor3f(0.0f, 0.0f, 0.0f);
	glPointSize(4.0);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0.0, 640.0, 0.0, 480.0);
}


void bresenHamAlgo()
{

	int dy = y2-y1, dx = x2-x1;	
	int xi = x1, yi = y1;
	
	int d = 2*dy - dx;

	while(xi <= x2){

		plot(xi, yi);

		if(d > 0){
			yi = yi + 1;
			d = d + 2*(dy-dx);			
		}else{
			d = d + 2*dy;
		}

		xi = xi + 1;
	
	}

}

void myDisplay(void)
{
	glClear (GL_COLOR_BUFFER_BIT);
	glColor3f (0.0, 0.0, 0.0);
	glPointSize(1.0);

	bresenHamAlgo();

	glFlush ();
}

int main(int argc, char** argv)
{	
	cout << "Enter the coordinates of the Line:\n\n" << endl;

	cout << "X1-coordinate   : "; cin >> x1;
	cout << "\nY1-coordinate : "; cin >> y1;
	cout << "\nX2-coordinate   : "; cin >> x2;
	cout << "\nY2-coordinate : "; cin >> y2;

	glutInit(&argc, argv);
	glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
	glutInitWindowSize (640, 480);
	glutInitWindowPosition (100, 150);
	glutCreateWindow ("DDA Alogrithm");
	glutDisplayFunc(myDisplay);
	myInit ();
	glutMainLoop();
	return 0;
}

