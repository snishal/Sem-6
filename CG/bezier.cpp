#include <stdio.h>
#include <iostream>
#include <GL/glut.h>
using namespace std;

struct point
{
int x,y;
}p1,p2,p3,p4;



void plot(int x, int y)
{
	glBegin(GL_POINTS);
	glVertex2i(x, y);
	glEnd();
}

void bezier(point p1, point p2, point p3, point p4)
{

	float x,y,t;
	for(t=0.0;t<=1.0;t+=.001)
	{
		x=(1-t)*(1-t)*(1-t)*p1.x+3*t*(1-t)*(1-t)*p2.x+3*t*t*(1-t)*p3.x+t*t*t*p4.x;
		y=(1-t)*(1-t)*(1-t)*p1.y+3*t*(1-t)*(1-t)*p2.y+3*t*t*(1-t)*p3.y+t*t*t*p4.y;
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

	bezier(p1, p2, p3, p4);

	glFlush ();
}

int main(int argc, char** argv)
{

    cout<<"Enter four control points of bezier curve: ";
    cout<<"1st point "; cin>>p1.x>>p1.y;
    cout<<"2nd point "; cin>>p2.x>>p2.y;
    cout<<"3rd point "; cin>>p3.x>>p3.y;
    cout<<"4th point "; cin>>p4.x>>p4.y;

	glutInit(&argc, argv);
	glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
	glutInitWindowSize (640, 480);
	glutInitWindowPosition (100, 150);
	glutCreateWindow ("Bezier Curve");
	glutDisplayFunc(myDisplay);
	myInit ();
	glutMainLoop();
	return 0;
}
