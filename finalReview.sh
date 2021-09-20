#Take a range from 0-100, find the digits that are repeated twice like 33,77 etc and store them in an array
arr=
function reverseOfNum() {
    unit_digit=0
    rev=""
	n=$1
    while [ $n -gt 0 ]
    do
        unit_digit=$(( $n % 10 ))
        n=$(( $n / 10 ))
        rev=$(echo ${rev}${unit_digit})
    done
    if [ "$rev" -eq $1 ]
    then
        arr+=(${rev})
    fi
}
for ((i=0;i<=100;i++))
do
    if (($i>9))
    then
        reverseOfNum $i 
    fi
done

echo ${arr[@]}
