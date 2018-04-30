#include <stdio.h>
#include <iostream>
#include <GL/glut.h>
using namespace std;

struct point
{
int x,y;
}p1,p4;

double r1,r4;

void plot(int x, int y)
{
	glBegin(GL_POINTS);
	glVertex2i(x, y);
	glEnd();
}

void hermite(point p1,point p4,double r1,double r4)
{
	float x,y,t;
	for(t=0.0;t<=1.0;t+=.001)
	{
		x=(2*t*t*t-3*t*t+1)*p1.x+(-2*t*t*t+3*t*t)*p4.x+(t*t*t-2*t*t+t)*r1+(t*t*t-t*t)*r4;
		y=(2*t*t*t-3*t*t+1)*p1.y+(-2*t*t*t+3*t*t)*p4.y+(t*t*t-2*t*t+1)*r1+(t*t*t-t*t)*r4;
		plot(x,y);
	 }
}



void myInit (void)
{
	glClearColor(1.0, 1.0, 1.0, 0.0); //specifies clear values for the color buffer, here it's white
	glColor3f(0.0f, 0.0f, 0.0f); //specifies the current values
	glPointSize(4.0); //specifies diameter of the rasterized points
	glMatrixMode(GL_PROJECTION); //specifies which matrix is the current matrix
	glLoadIdentity();  //replaces the current matrix with the identity matrix
	gluOrtho2D(0.0, 640.0, 0.0, 480.0);
}

void myDisplay(void)
{
	glClear (GL_COLOR_BUFFER_BIT);
	glColor3f (0.0, 0.0, 0.0);
	glPointSize(1.0);

	hermite(p1,p4,r1,r4);

	glFlush ();
}

int main(int argc, char** argv)
{
	cout << "Enter two hermite points: " << endl;

	cout << "X1-coordinate : "; cin >> p1.x;
	cout << "Y1-coordinate : "; cin >> p1.y;
	cout << "X2-coordinate : "; cin >> p4.x;
	cout << "Y2-coordinate : "; cin >> p4.y;

	cout << "Enter the tangents at these points respectively " << endl;
	cin>>r1>>r4;

	glutInit(&argc, argv);
	glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
	glutInitWindowSize (640, 480);
	glutInitWindowPosition (100, 150);
	glutCreateWindow ("Hermite Curve");
	glutDisplayFunc(myDisplay);
	myInit ();
	glutMainLoop();
	return 0;
}
