#include <stdio.h>
#include <iostream>
#include <GL/glut.h>
using namespace std;

struct Point{
	int x,y;
}p1,p2,p3;

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

	int dx = p2.x - p1.x;
    int dy = p2.y - p1.y;

    int steps = abs(dx) > abs(dy) ? abs(dx) : abs(dy);

    float Xinc = dx / (float) steps;
    float Yinc = dy / (float) steps;

    float X = p1.x;
    float Y = p1.y;
    for (int i = 0; i <= steps; i++)
    {
        plot(X,Y);
        X += Xinc;
        Y += Yinc;
    }

}

void myDisplay()
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

	p1.x = x;
	p1.y = y;

	cout << "\nX2-coordinate   : "; cin >> x;
	cout << "\nY2-coordinate : "; cin >> y;

	p2.x = x;
	p2.y = y;

	cout << "\nX3-coordinate   : "; cin >> x;
	cout << "\nY3-coordinate : "; cin >> y;

	p3.x = x;
	p3.y = y;

	glutInit(&argc, argv);
	glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
	glutInitWindowSize (640, 480);
	glutInitWindowPosition (100, 150);
	glutCreateWindow ("Triangle Alogrithm");
	glutDisplayFunc(myDisplay);
	myInit ();
	glutMainLoop();
	return 0;
}
