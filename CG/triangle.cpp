#include <stdio.h>
#include <iostream>
#include <GL/glut.h>
using namespace std;

struct Point{
	int x,y;
	Point(int x, int y){
		this->x = x;
		this->y = y;
	}
};

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


void ddaAlgo(Point p1, Point p2)
{

	int xi = p1.x, yi = p1.y;
	
	int m = (p2.y-y1)/(p2.x-x1);

	while(xi != p2.x){

		plot(xi, yi);
		
		xi = xi + 1;
		yi = yi + m;	

	}

}

void myDisplay(Point p1, Point p2, Point p3)
{
	glClear (GL_COLOR_BUFFER_BIT);
	glColor3f (0.0, 0.0, 0.0);
	glPointSize(1.0);

	ddaAlgo(p1, p2);
	ddaAlgo(p1, p3);
	ddaAlgo(p2, p3);

	glFlush ();
}

int main(int argc, char** argv)
{	
	int x, y;
	cout << "Enter the coordinates of the Triangle:\n\n" << endl;

	cout << "X1-coordinate   : "; cin >> x;
	cout << "\nY1-coordinate : "; cin >> y;
	
	Point p1(x,y);

	cout << "\nX2-coordinate   : "; cin >> x;
	cout << "\nY2-coordinate : "; cin >> y;

	Point p2(x,y);

	cout << "\nX3-coordinate   : "; cin >> x;
	cout << "\nY3-coordinate : "; cin >> y;

	Point p3(x,y);

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

