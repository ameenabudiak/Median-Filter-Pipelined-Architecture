
#include <iostream>
#include <algorithm>
using std::cout;
using std::endl;

// Defining a function to find the median of an array of ints, 

int findMedian(int intArray[], int length) {
	int median;
	// Sorting array
	std::sort(intArray, intArray + length);
	// Calculate the median 
	median = intArray[(length / 2)]; 
	return median;
}

int main() {
    int f=3; // filter size
    int n=5; // image size 
	int arrayOne[n*n] = { 
	    117,224,111,108,151,
	    230,255,87,114,161,
	    41,61,220,202,225,
	    105,199,211,31,111,
	    123,118,255,135,9,
	};
	int newarray[n*n]={0};
	
	

	
for(int i=0;i<n*n;i++){
	//check if the pixel is on edge or not 
    if(i/n==0 ||i%n==0 ||i%n==n-1||i/n==n-1  ){ 
// if yes don't change the value 
        newarray[i]=arrayOne[i]; 
    }
// if no apply the median filter
    else{ 
// create an array with filter size for pixel neighbor       
     int narray[f*f] ={0};    
    narray[0]=arrayOne[i];
    narray[1]=arrayOne[i-1];
    narray[2]=arrayOne[i+1];
    narray[3]=arrayOne[i-n];
    narray[4]=arrayOne[i-n-1];
    narray[5]=arrayOne[i-n+1];
    narray[6]=arrayOne[i+n];
    narray[7]=arrayOne[i+n-1];
    narray[8]=arrayOne[i+n+1];
	    
// find median of array
 newarray[i]=findMedian(narray, 9) ; 

        
    }
}
	
cout<<endl<<"old array"<<endl;
for(int a=0;a<n*n;a++){
    if(a%n==0){cout<<endl;}
    cout<<arrayOne[a]<<"  ";
}
cout<<endl<<endl<<"new array"<<endl;

for(int a=0;a<n*n;a++){
    if(a%n==0){cout<<endl;}
    cout<<newarray[a]<<"  ";
}

}


