#include <GL/glut.h>
#include <iostream>
using namespace std;

const int INSIDE = 0; // 0000
const int LEFT = 1;   // 0001
const int RIGHT = 2;  // 0010
const int BOTTOM = 4; // 0100
const int TOP = 8;    // 1000

int **pts;

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


void transform(int *mat1, int mat2[][3], int res[1][3])
{
    int j, k;
    for (j = 0; j < 3; j++)
    {
     	res[0][j] = 0;
        for (k = 0; k < 3; k++)
        {
        	res[0][j] += mat1[k]*mat2[k][j];
    	}
    }
}

void reflectx(int *pt){

	int t[3][3] = { {100, 0, 0},
                    {0, 1, 0},
                    {0, 0, 1} };
    int res[1][3];
	transform(pt, t, res);
	cout<<"Transformed :"<<res[0][0]<<"\t"<<res[0][1]<<endl;
	plot(res[0][0], res[0][1]);	
	
}

void myDisplay() {
  glClear(GL_COLOR_BUFFER_BIT);
  glColor3f(0.0, 0.0, 0.0);
  glPointSize(1.0);

  for(int i = 0; i<100; i++){
  	plot(pts[i][0],pts[i][1]);
  	reflectx(pts[i]);	
  }

  glFlush();
}

int main(int argc, char **argv) {
  int x, y;
  
  pts = new int*[100];
  
  for(int i = 0; i<100; i++){
  
  	pts[i] = new int[3];
  	pts[i][0] = i+1;
  	pts[i][1] = 2;
  	pts[i][2] = 1;
  	
  }
  
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
  glutInitWindowSize(640, 480);
  glutInitWindowPosition(100, 150);
  glutCreateWindow("2d Transform");
  glutDisplayFunc(myDisplay);
  myInit();
  glutMainLoop();
  return 0;
}
