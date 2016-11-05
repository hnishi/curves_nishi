#!/bin/bash -eu


#  v 1.4
#  nohup bash do2_curves.bash > zzz.log &
#

n_process=8
n_frames=50001
fn_out0=angle_dist.dat
#p_pwd=$(pwd)
#p_data=${p_pwd}/pdbs
p_data=pdbs
n_start=3

rm -f $fn_out0

n_decomp=`echo ${n_frames}/${n_process}|bc`
n_rest=`echo ${n_frames}%${n_process}|bc`
let "n_tmp1 = ${n_decomp}+${n_rest}"
let "n_tmp2 = ${n_process}-1"

pwd
cd $p_data
pwd
ii=0
jj=$n_start
for i in `seq 1 $n_tmp2`
do
  echo $i $ii $((${ii}+${n_decomp}-1))
  echo cpu $jj 
  #nohup bash curves.bash $i $ii $((${ii}+${n_decomp}-1)) &>/dev/null &
  taskset -c $i nohup bash ../curves.bash $i $ii $((${ii}+${n_decomp}-1)) &>/dev/null &
  let "ii = ${ii}+${n_decomp}"
  let "jj = ${jj}+1"
sleep 1s
done

  echo $n_process $ii $((${ii}+${n_tmp1}-1))
  #nohup bash curves.bash $n_process $ii $((${ii}+${n_tmp1}-1)) &>/dev/null
  #taskset -c $n_process time bash ../curves.bash $n_process $ii $((${ii}+${n_tmp1}-1)) 
  taskset -c $jj time bash ../curves.bash $n_process $ii $((${ii}+${n_tmp1}-1)) 


echo "for i in `seq 1 $n_process`; do cat ${p_data}/angle_dist_${i}.tmp >> angle_dist.dat;done"

#cd  $p_pwd
cd ..
for i in `seq 1 $n_process`
do
  cat ${p_data}/angle_dist_${i}.tmp >> angle_dist.dat
done

