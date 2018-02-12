#include <stdio.h>
#include <iostream>
#include <GL/glut.h>
using namespace std;

const int INSIDE = 0; // 0000
const int LEFT = 1;   // 0001
const int RIGHT = 2;  // 0010
const int BOTTOM = 4; // 0100
const int TOP = 8; //1000

const int x_max = 10;
const int y_max = 8;
const int x_min = 4;
const int y_min = 4;

struct Point {
								int x,y;
} p1,p2;

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

int computeCode(float x, float y)
{
								int code = INSIDE;

								if (x < x_min)
																code |= LEFT;
								else if (x > x_max)
																code |= RIGHT;
								if (y < y_min)
																code |= BOTTOM;
								else if (y > y_max)
																code |= TOP;

								return code;
}

void cohenSutherlandClip(Point p1, Point p2)
{
								int x1 = p1.x, y1 = p1.y;
								int x2 = p2.x, y2 = p2.y;
								int code1 = computeCode(x1,y1);
								int code2 = computeCode(x2,y2);

								bool accept = false;

								while (true)
								{
																if ((code1 == 0) && (code2 == 0))
																{
																								accept = true;
																								break;
																}
																else if (code1 & code2)
																{
																								break;
																}
																else
																{
																								int code_out;
																								float x, y;
																								if (code1 != 0)
																																code_out = code1;
																								else
																																code_out = code2;

																								if (code_out & TOP)
																								{
																																x = x1 + (x2 - x1) * (y_max - y1) / (y2 - y1);
																																y = y_max;
																								}
																								else if (code_out & BOTTOM)
																								{
																																x = x1 + (x2 - x1) * (y_min - y1) / (y2 - y1);
																																y = y_min;
																								}
																								else if (code_out & RIGHT)
																								{
																																y = y1 + (y2 - y1) * (x_max - x1) / (x2 - x1);
																																x = x_max;
																								}
																								else if (code_out & LEFT)
																								{
																																y = y1 + (y2 - y1) * (x_min - x1) / (x2 - x1);
																																x = x_min;
																								}

																								if (code_out == code1)
																								{
																																x1 = x;
																																y1 = y;
																																code1 = computeCode(x1, y1);
																								}
																								else
																								{
																																x2 = x;
																																y2 = y;
																																code2 = computeCode(x2, y2);
																								}
																}
								}
								if (accept)
								{
																cout <<"Line accepted from " << x1 << ", "<< y1 << " to "<< x2 << ", " << y2 << endl;
																p1.x = x1;
																p1.y = y1;
																p2.x = x2;
																p2.y = y2;
																ddaAlgo(p1,p2);
								}
								else{
																cout << "Line rejected" << endl;
								}
}

void myDisplay()
{
								glClear (GL_COLOR_BUFFER_BIT);
								glColor3f (0.0, 0.0, 0.0);
								glPointSize(1.0);

								Point pr1, pr2;

								pr1.x = x_min;
								pr1.y = y_min;
								pr2.x = x_max;
								pr2.y = y_min;
								ddaAlgo(pr1, pr2);

								pr1.x = x_min;
								pr1.y = y_min;
								pr2.x = x_min;
								pr2.y = y_max;
								ddaAlgo(pr1, pr2);

								pr1.x = x_max;
								pr1.y = y_min;
								pr2.x = x_max;
								pr2.y = y_max;
								ddaAlgo(pr1, pr2);

								pr1.x = x_min;
								pr1.y = y_max;
								pr2.x = x_max;
								pr2.y = y_max;
								ddaAlgo(pr1, pr2);

								cohenSutherlandClip(p1, p2);

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

								glutInit(&argc, argv);
								glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
								glutInitWindowSize (640, 480);
								glutInitWindowPosition (100, 150);
								glutCreateWindow ("cohenSutherland Alogrithm");
								glutDisplayFunc(myDisplay);
								myInit ();
								glutMainLoop();
								return 0;
}
