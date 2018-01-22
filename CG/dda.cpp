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


void ddaAlgo()
{

	int xi = x1, yi = y1;
	
	int m = (y2-y1)/(x2-x1);

	while(xi != x2){

		plot(xi, yi);
		
		xi = xi + 1;
		yi = yi + m;	

	}

}

void myDisplay(void)
{
	glClear (GL_COLOR_BUFFER_BIT);
	glColor3f (0.0, 0.0, 0.0);
	glPointSize(1.0);

	ddaAlgo();

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

