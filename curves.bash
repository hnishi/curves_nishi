#!/bin/bash -eu

# v 1.3
#
#  nohup bash do2_curves.bash > zzz.log &
#

fn_out0=angle_dist.dat
#p_curv=/home/hnishi/programs/curves+
p_curv=/lfs/mtateno/hnishi/tools/curves+
fn_exe=CurKai
exe_helicalcpp=/lfs/mtateno/hnishi/tools/helical/a.out 
#p_data=$(pwd)  #/lfs/mtateno/hnishi/kekex/05_64core/seppdbs/pdbs
#p_data=pdbs

rm -f $fn_out0

#cd $p_data
fn_tmp=angle_dist_${1}.tmp
rm -f $fn_tmp
for i in `seq $2 $3`
#for i in {0..10000}
do
  fn_out=conf${i}_a
  rm -f ${fn_out}*.*
$p_curv/$fn_exe <<!
&inp file=conf${i}, lis=${fn_out},
 lib=$p_curv/standard,
 ions=.f.,line=.t.,test=.t.,axfrm=.f.,
&end
2 1 -1 0 0
1:38
76:39
!
  grep Line ${fn_out}.lis > vec${i}.txt

  fn_out=conf${i}_b
  rm -f ${fn_out}*.*
$p_curv/$fn_exe <<!
&inp file=conf${i}, lis=${fn_out},
 lib=$p_curv/standard,
 ions=.f.,line=.t.,test=.t.,axfrm=.f.,
&end
2 1 -1 0 0
77:114
152:115
!
  grep Line ${fn_out}.lis >> vec${i}.txt
  ${exe_helicalcpp} < vec${i}.txt >> $fn_tmp
  rm vec${i}.txt
done
  #13:26
  #64:51
  #89:102
  #64:127


