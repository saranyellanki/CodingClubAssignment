TITLE="IPL Points Table"
SEASON=2020
MATCHES_PLAYED=14
win=0
lose=0
points=0
nrr=""
position=0
isEligibleForSemiFinals=false
playoffMessage="eligible for play-offs"
rcbTeam=("kholi" "abd" "siraj")
declare -A cskTeam
cskTeam[captain]="Dhoni"
cskTeam[batsman]="Raina"
cskTeam[bowler]="Jadeja"


echo "Select Your Favourite Team"
echo "MI RCB CSK SRH KKR PBKS RR DC"
read teamName


teamName=`echo "$teamName" | awk '{print tolower($0)}'`


    function showError() {
             echo "Your Given Input Is Invalid :( Please Check Your Characters :("
    }


if [ $teamName == 'mi' ]
then
     position=1
elif [ $teamName == 'dc' ]
then
     position=2
elif [ $teamName == 'srh' ]
then
     position=3
elif [ $teamName == 'rcb' ]
then
     position=4
elif [ $teamName == 'kkr' ]
then
     position=5
elif [ $teamName == 'pbks' ]
then
     position=6
elif [ $teamName == 'csk' ]
then
     position=7
elif [ $teamName == 'rr' ]
then
     position=8
else
     showError
fi
     function msg() {

              echo $1 Is a $3 Of $2


     }


     function captain() {


             msg $1 $2 'Captain'


     }


     function batsman() {


              msg $1 $2 'Batsman'


     }


     function bowler() {


              msg $1 $2 'Bowler'


     }
     
     function findingRolesAndResponsibility() {


              if [ $2 == "RCB" ]
              then


                  for value in ${rcbTeam[*]}
                  do
                      if [ $value == "kholi" ]
                      then
                          value=`echo "$value" | awk '{print toupper($0)}'`
                          captain $value $2
                      elif [ $value == "abd" ]
                      then
                          value=`echo "$value" | awk '{print toupper($0)}'`
                          batsman $value $2
                      elif [ $value == "siraj" ]
                      then
                          value=`echo "$value" | awk '{print toupper($0)}'`
                          bowler $value $2
                      else
                          echo " "
                      fi
                        
                  done
              elif [ $2 == "CSK" ]
              then


                  for value in ${cskTeam[*]}
                  do
                      if [ $value == "Dhoni" ]
                      then
                          value=`echo "$value" | awk '{print toupper($0)}'`
                          captain $value $2
                      elif [ $value == "Raina" ]
                      then
                          value=`echo "$value" | awk '{print toupper($0)}'`
                          batsman $value $2
                      elif [ $value == "Jadeja" ]
                      then
                          value=`echo "$value" | awk '{print toupper($0)}'`
                          bowler $value $2
                      else
                          echo " "
                      fi
                  done
                   
              fi




     }


     function message() {


              if [ -z "$2" ]
              then
                   echo $1 $playoffMessage
              else
                   echo $1 $2 $playoffMessage
              fi


     }


     function playOff() {


              if [[ $1 -ge 1 && $1 -le 4 ]]
              then
                  isEligibleForSemiFinals=true
              fi
              
              if [ "$isEligibleForSemiFinals" = true ]
              then
                  message $2 " "
              else
                  message $2 "not"
              fi


     }


     function pointsCalculator() {


              lose=$((MATCHES_PLAYED-$2))
              points=$(($2*2))
              teamName=`echo "$teamName" | awk '{print toupper($0)}'`
              echo $TITLE
              echo "Period : $SEASON"
              echo "Place Secured : $1"
              echo "Team : $teamName"
              echo "Match Faced : $MATCHES_PLAYED"
              echo "Won : $2   Lost : $lose"
              echo "Run Rate : $3"
              echo "Points : $points"
              playOff $1 $teamName
              findingRolesAndResponsibility $1 $teamName


     }


case $position in
   1)
      win=9
      nrr="+1.107"
      pointsCalculator $position $win $nrr
      ;;
   2)
      win=8
      nrr="-0.109"
      pointsCalculator $position $win $nrr
      ;;
   3)
      win=7
      nrr="+0.608"
      pointsCalculator $position $win $nrr
      ;;
   4)
      win=7
      nrr="-0.172"
      pointsCalculator $position $win $nrr
      ;;
   5)
      win=7
      nrr="-0.214"
      pointsCalculator $position $win $nrr
      ;;
   6)
      win=6
      nrr="-0.162"
      pointsCalculator $position $win $nrr
      ;;
   7)
      win=6
      nrr="-0.455"
      pointsCalculator $position $win $nrr
      ;;
   8)
      win=6
      nrr="-0.569"
      pointsCalculator $position $win $nrr
      ;;
   *)
     
     ;;
esac