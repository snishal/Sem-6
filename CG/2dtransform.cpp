#include <GL/glut.h>
#include <iostream>
using namespace std;

int nPoint;
struct Point{
  int x;
  int y;
  int h;
}*pts;

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


void transform(int mat1[][3], int mat2[][3], int res[][3])
{
    int i,j,k;
    for(int i = 0; i < nPoint; i++){
      for (j = 0; j < 3; j++)
      {
        res[i][j] = 0;
        for (k = 0; k < 3; k++)
        {
        	res[i][j] += mat1[i][k]*mat2[k][j];
    	  }
      }
    }
}

void matToPoint(int mat[][3], Point *res){

  for (int i = 0; i < nPoint; i++){
      res[i].x = mat[i][0];
      res[i].y = mat[i][1];
      res[i].h = mat[i][2];
  }

}

void pointToMat(Point *res, int mat[][3]){

  for (int i = 0; i < nPoint; i++){
      mat[i][0] = res[i].x;
      mat[i][1] = res[i].y;
      mat[i][2] = res[i].h;
  }

}

void plotPoints(Point *p){
  glBegin(GL_POLYGON);

  for(int i = 0; i<nPoint; i++){
    glVertex2i(p[i].x, p[i].y);
  }

  glEnd();
}

Point* translate(Point *p){

	int t[3][3] = { {1, 0, 0},
                    {0, 1, 0},
                    {0, 400, 1} };

  int matPoint[nPoint][3];
  pointToMat(p, matPoint);

  int resPoint[nPoint][3];
  transform(matPoint, t, resPoint);

  Point *res;
  res = new Point[nPoint];
  matToPoint(resPoint, res);

  return res;

}

void myDisplay() {
  glClear(GL_COLOR_BUFFER_BIT);
  glColor3f(0.0, 0.0, 0.0);
  glPointSize(1.0);

  plotPoints(pts);

  Point *p;
  p = translate(pts);
  plotPoints(p);

  glFlush();
}

int main(int argc, char **argv) {

  cout << "Enter Number of points : ";
  cin >> nPoint;

  pts = new Point[nPoint];

  for(int i = 0; i<nPoint; i++){

    cout << "Enter Point" << i + 1 << " : ";
  	cin >> pts[i].x;
  	cin >> pts[i].y;
  	pts[i].h = 1;

    cout << endl;

  }

  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
  glutInitWindowSize(1000, 1000);
  glutInitWindowPosition(100, 150);
  glutCreateWindow("2d Transform");
  glutDisplayFunc(myDisplay);
  myInit();
  glutMainLoop();
  return 0;
}
