/*  20161027 v1.1
double helical DNA analysis
    Angle
    Distance
c********************************************************************
c  angle = acos(a*b/(|a||b|))
c  distance = |(aob)*(p1-p2)/|aob||, at |aob|!=0
c           = |ao(p1-p2)|/|a|,       at |aob| =0
c     inner product: *
c     cross product: o
c********************************************************************/
#include<iostream>      // std::cout
#include<vector>        
#include<fstream>

#include<functional>    // std::minus, std::divides
#include<numeric>       // std::inner_product
#include<cmath>         // acos()

using namespace std;

#define REAL double
#define PI 3.14159265359

int main(){
   //two unit vectors parallele to the vectors
   //static const REAL arr[] = {-0.186,  0.978,  0.095};
   //static const REAL arr2[] = {-0.380, -0.923,  0.0619};
   //two coordinates on the vectors
   //REAL p1[] = {49.520, 11.767, 20.929};
   //REAL p2[] = {45.435, 51.096, 33.574};
   REAL u1[3],u2[3],p1[3],p2[3];
   string gomi;
   cin>>gomi>>gomi;
   for(int i=0;i<3;i++) cin>>u1[i];
   cin>>gomi;
   for(int i=0;i<3;i++) cin>>p1[i];
   cin>>gomi>>gomi;
   for(int i=0;i<3;i++) cin>>u2[i];
   cin>>gomi;
   for(int i=0;i<3;i++) cin>>p2[i];

   //for(int i=0;i<3;i++) printf("%f %f %f %f\n",u1[i],p1[i],u2[i],p2[i]);

   vector<REAL> v1 (u1, u1 + sizeof(u1) / sizeof(u1[0]) );
   vector<REAL> v2 (u2, u2 + sizeof(u2) / sizeof(u2[0]) );
   
   REAL dot = inner_product(v1.begin(),v1.end(),v2.begin(),0.0);
   //cout<<"Inner product: "<<dot<<endl;
   REAL angle = acos(dot)*180./3.14159265359 - 180;
   //cout<<"Angle: "<<angle<<endl;

   REAL aaa = (v1[1]*v2[2]-v2[1]*v1[2])*(p1[0]-p2[0])
              +(v1[2]*v2[0]-v2[2]*v1[0])*(p1[1]-p2[1])
              +(v1[0]*v2[1]-v2[0]*v1[1])*(p1[2]-p2[2]);
   REAL bbb = sqrt(pow((v1[1]*v2[2]-v2[1]*v1[2]),2.)
              +pow((v1[2]*v2[0]-v2[2]*v1[0]),2.)
              +pow((v1[0]*v2[1]-v2[0]*v1[1]),2.));
   REAL distance = sqrt(pow(aaa,2.))/bbb;
   //cout<<"Distance: "<<distance<<endl;
   
   printf("%8.3f%8.3f \n",angle,distance);

   return 0;    
}


