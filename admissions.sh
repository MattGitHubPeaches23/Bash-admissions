#!/bin/bash
# Admissions library.
#
# Copyright (c) 2019, Matthew Chalifoux.
#


admissions () {


    awk -v sub12=$1 '

        function work(x,alumCheck,affirmCheck,alum,affirm) {
            
            for(j=1; j <= x; ++j){
                split(x,checking)
            }
            # for(i=1; i <= length(checking); i++){
            #     printf("%s "i"\n", checkings[i])                 
            # }            

            if(alumCheck < alum && checking[2] == "T"){
                return 1
            } else if(affirmCheck < affirm && checking[3] == "T"){                
                return 2
            } 

        }
        
        function cmp(i1, v1, i2, v2) {
            # print i1, v1, i2, v2
            split(v1, chars1)
            # print length(chars1)
            # for (i=1; i <= length(chars1); i++) {
            #     printf("%s\n", chars1[i])            
            # }
                
            split(v2, chars2)
            # print length(chars2)
            # for (i=1; i <= length(chars2); i++) {
            #     printf("%s\n", chars2[i])            
            # }

            if(chars1[1] != chars2[1]){
                #print "chars2[1] - chars1[1] = " chars2[1] - chars1[1]
                return chars2[1] - chars1[1]
            } else if( chars1[1] == chars2[1]){
                if(chars1[2] <= chars2[2] ) {
                    return 1                    
                } else{ 
                    return -1
                 } 
            }                              
        }           
        

        BEGIN {      
            #print "STARTING"
        }

        {
            # if($5 == "T"){
            #     $2=1
            # }
            #print $1, $2, $3, $4, $5, $6, $7, $8, $9
            
            # print $0
            
            a=$2 / 4.0
            b= $7 / 5.0
            c=a + b
            d=$1 " " $3 " " $5
            adjusted[d]=c " " $2
            #print adjusted[d]            
        }
        END {
            # print "Finished"  

            asorti(adjusted, order, "cmp")   

            # for ( i in order ) {        
            #     printf("%20s %-6f\n", order[i], adjusted[order[i]])                
            # }             

            
            


            #print sub12
            alum=int(sub12 * .2)
            #print alum
            affirm=int(sub12 * .1)
            #print "AFFIRM = " affirm
            alumCheck=0
            affirmCheck=0
            count=1

            

            while(count != (guranteed + 1)){
                split(order[count],holder)                
                final[count]=holder[1]
                if(1 == work(order[count],alumCheck,affirmCheck,alum,affirm)){
                    alumCheck++
                    # print "alumCheck++ " alumCheck
                } else if(2 == work(order[count],alumCheck,affirmCheck,alum,affirm)){
                    affirmCheck++
                    # print "affirmCheck++ " affirmCheck
                }
                count++                
            }
            # print alumCheck
            # print affirmCheck

            subCount=count
            
            stop_Count=count

            cntTrack=1
            


            if(alumCheck == alum && affirmCheck == affirm){
                while(count != (sub12 + 1)){
                    split(order[count],holder)                
                    final[count]=holder[1]
                    count++
                }
            }
            else {
                while((affirmCheck + alumCheck) != (alum + affirm) && subCount != (sub12 + 1)){
                    split(order[count],holder)   
                    if(1 == work(order[count],alumCheck,affirmCheck,alum,affirm)){
                        final[subCount]=holder[1]
                        tracK[cntTrack]=holder[1]
                        cntTrack++
                        alumCheck++
                        subCount++
                    } else if(2 == work(order[count],alumCheck,affirmCheck,alum,affirm)){
                        final[subCount]=holder[1]
                        tracK[cntTrack]=holder[1]
                        cntTrack++
                        affirmCheck++
                        subCount++
                    } 
                    count++                
                }
            } 

            while(subCount != (sub12 + 1)){
                split(order[stop_Count],holder)
                lap=0
                for(i=1; i < cntTrack; i++){
                    if(holder[1] == tracK[i]){
                        lap=1
                    }
                }
                if(1 != lap){
                    final[subCount]=holder[1]
                    subCount++               
                }    
                stop_Count++
            }                                   
            
            
            for(i=1; i <= sub12; ++i){
                print final[i]
            }
        }            
    ' data 
}

#  admissions $1