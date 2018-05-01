#include <GL/glut.h>
#include <iostream>
using namespace std;

int nPoint;
struct Point{
  int x;
  int y;
  int z;
  int h;
}*pts;

void myInit(void) {
  glClearColor(1.0, 1.0, 1.0, 0.0);
  glColor3f(0.0f, 0.0f, 0.0f);
  glPointSize(4.0);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  gluOrtho2D(0.0, 640.0, 0.0, 480.0);
}


void transform(int mat1[][4], int mat2[][4], int res[][4])
{
    int i,j,k;
    for(int i = 0; i < nPoint; i++){
      for (j = 0; j < 4; j++)
      {
        res[i][j] = 0;
        for (k = 0; k < 4; k++)
        {
        	res[i][j] += mat1[i][k]*mat2[k][j];
    	  }
      }
    }
}

void matToPoint(int mat[][4], Point *res){

  for (int i = 0; i < nPoint; i++){
      res[i].x = mat[i][0];
      res[i].y = mat[i][1];
      res[i].z = mat[i][2];
      res[i].h = mat[i][3];
  }

}

void pointToMat(Point *res, int mat[][4]){

  for (int i = 0; i < nPoint; i++){
      mat[i][0] = res[i].x;
      mat[i][1] = res[i].y;
      mat[i][2] = res[i].z;
      mat[i][3] = res[i].h;
  }

}

void plotPoints(Point *p){
  glBegin(GL_POLYGON);

  for(int i = 0; i<nPoint; i++){
    glVertex2i(p[i].x, p[i].y); //ignore z-cordinate for orthographic projection
  }

  glEnd();
}

Point* translate(Point *p){

	int t[4][4] = {
                  {1, 0, 0, 0},
                  {0, 1, 0, 0},
                  {0, 0, 1, 0},
                  {0, 200, 0, 1},
                };

  int matPoint[nPoint][4];
  pointToMat(p, matPoint);

  int resPoint[nPoint][4];
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
    cin >> pts[i].z;
  	pts[i].h = 1;

    cout << endl;

  }

  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
  glutInitWindowSize(1000, 1000);
  glutInitWindowPosition(100, 150);
  glutCreateWindow("3d Transform");
  glutDisplayFunc(myDisplay);
  myInit();
  glutMainLoop();
  return 0;
}
