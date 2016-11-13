#!/bin/bash -eu

#
# v1.1
#

#fn_in=md3_fin_vmd.pdb
fn_in=$1
fn_out=out_form.pdb

cp $fn_in $fn_out 
for chain in A B C D
do
  echo $chain
  res1=$(grep "ATOM" $fn_out |grep " X " |head -1|awk '{print $6}')
  echo $res1
  awk -v res=38 -v res1=${res1} -v chain=$chain '
    BEGIN {flag1=0;i=res1} 
    {
      if("X"==$5 && $6==i){
        gsub(/X/,chain)
        print 
        flag1=5
        #print flag1
      }
      else if(5==flag1 && i<res+res1-1){
        i++
        gsub(/X/,chain)
        print $0
        flag1=0
        #exit 1
      }else if(5==flag1&&i==res+res1-1){
        printf("TER\n")
        flag1=0
      }else {
      #exit 1 
      #print flag1
      print $0
      }
    }' $fn_out > zzz.tmp  
  mv zzz.tmp $fn_out 
done

