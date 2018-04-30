#include <GL/glut.h>
#include <iostream>
using namespace std;

int nPoint;
struct Point{
  float x;
  float y;
  float z;
  float h;
}*pts;


void myInit(void) {
  glClearColor(1.0f, 1.0f, 1.0f, 1.0f); // Set background color to black and opaque
  glClearDepth(1.0f);                   // Set background depth to farthest
  glEnable(GL_DEPTH_TEST);   // Enable depth testing for z-culling
  glDepthFunc(GL_LEQUAL);    // Set the type of depth-test
  glShadeModel(GL_SMOOTH);   // Enable smooth shading
  glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);  // Nice perspective corrections
}


void transform(float mat1[][4], float mat2[][4], float res[][4])
{
    int i,j, k;
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

void matToPoint(float mat[][4], Point *res){

  for (int i = 0; i < nPoint; i++){
      res[i].x = mat[i][0];
      res[i].y = mat[i][1];
      res[i].z = mat[i][2];
      res[i].h = mat[i][3];
  }

}

void pointToMat(Point *res, float mat[][4]){

  for (int i = 0; i < nPoint; i++){
      mat[i][0] = res[i].x;
      mat[i][1] = res[i].y;
      mat[i][2] = res[i].z;
      mat[i][3] = res[i].h;
  }

}

void plotPoints(Point *p){
  glColor3f(0.0f, 1.0f, 0.0f);
  glBegin(GL_POLYGON);

  for(int i = 0; i<nPoint; i++){
    glVertex3f(p[i].x, p[i].y, p[i].z);
    cout << p[i].x << " : " << p[i].y << " : " << p[i].z << endl;
  }

  glEnd();
}

Point* translate(Point *p){

	float t[4][4] = {
                  {1, 0, 0, 0},
                  {0, 1, 0, 0},
                  {0, 0, 1, 0},
                  {0, 300, 0, 1}
                };

  float matPoint[nPoint][4];
  pointToMat(p, matPoint);

  float resPoint[nPoint][4];
  transform(matPoint, t, resPoint);

  Point *res;
  res = new Point[nPoint];
  matToPoint(resPoint, res);

  return res;

}

void myDisplay() {

   glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // Clear color and depth buffers
   glMatrixMode(GL_MODELVIEW);     // To operate on model-view matrix

   // Render a color-cube consisting of 6 quads with different colors
   glLoadIdentity();                 // Reset the model-view matrix
   glTranslatef(1.5f, 0.0f, -7.0f);  // Move right and into the screen

   plotPoints(pts);

   Point *p;
   p = translate(pts);
   plotPoints(p);

   glutSwapBuffers();  // Swap the front and back frame buffers (double buffering)

}

void reshape(GLsizei width, GLsizei height) {  // GLsizei for non-negative integer
   // Compute aspect ratio of the new window
   if (height == 0) height = 1;                // To prevent divide by 0
   GLfloat aspect = (GLfloat)width / (GLfloat)height;

   // Set the viewport to cover the new window
   glViewport(0, 0, width, height);

   // Set the aspect ratio of the clipping volume to match the viewport
   glMatrixMode(GL_PROJECTION);  // To operate on the Projection matrix
   glLoadIdentity();             // Reset
   // Enable perspective projection with fovy, aspect, zNear and zFar
   gluPerspective(45.0f, aspect, 0.1f, 100.0f);
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

  glutInit(&argc, argv);            // Initialize GLUT
  glutInitDisplayMode(GLUT_DOUBLE); // Enable double buffered mode
  glutInitWindowSize(640, 480);   // Set the window's initial width & height
  glutInitWindowPosition(50, 50); // Position the window's initial top-left corner
  glutCreateWindow("3d");          // Create window with the given title
  glutDisplayFunc(myDisplay);       // Register callback handler for window re-paint event
  glutReshapeFunc(reshape);       // Register callback handler for window re-size event
  myInit();                       // Our own OpenGL initialization
  glutMainLoop();
  return 0;
}
