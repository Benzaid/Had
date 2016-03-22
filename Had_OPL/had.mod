/*********************************************
 * OPL 12.4 Model
 * Author: ybenzaid
 * Creation Date: 4 mars 2016 at 15:08:01
 *********************************************/
//Data
int N=...;
int K=...;
float t[1..N+1][1..N+1]=...;
int  r[1..N][1..K]=...;
//int E[1..K]=...;
//int L[1..K]=...;
//int e[1..N]=...;
//int l[1..N]=...;
//int W=...;
//float s[1..N]=...;
//float c[1..N][1..K]=...;
//int r[1..N]=...;

//les varaibles de décisions 
dvar boolean x[1..N+1][1..N+1][1..K] in 0..1;

//la fonction objectif 
minimize sum (i in 1..N+1) sum( j in 1..N+1) sum(k in 1..K)

                t[i][j] * x[i][j][k]  ;
subject to {
  //C1:Contrainte de compétence 
   forall (i in 1..N) forall (j  in 1..N ) forall (k in 1..K)
      x[i][j][k]<=r[i][k];
      
   forall (i in 1..N) forall (j  in 1.. N) forall (k in 1..K)
      x[j][i][k]<=r[i][k];   
      
  //C2:Un job est fait par un seul personnel
   forall (i in 1..N) 
   sum(k in 1..K) sum (j in 1..N+1)   x[i][j][k]==1;

//C3:contrainte de conservation de flot
  forall (i in 1..N) forall (k in 1..K) 
  (sum(j in 1..N+1) x[i][j][k])- (sum(j in 1..N+1) x[j][i][k])==0;

//C4:Contrainte de debut des jobs
  forall (k in 1..K) 
  sum(i in 1..N+1)   x[N+1][i][k]==1;
    
 forall (k in 1..K) 
 sum(j in 1..N+1)   x[N+1][j][k]==1;
 //C5:contrainte les personnels nont affecter resteron au HAD
 forall(k in 1..K) forall(i in 1..N)
    x[i][i][k]==0;
  
  
  
}  
        
    