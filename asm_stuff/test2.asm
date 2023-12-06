      Line     Address      Opcode      Label            DisAssy          
       4    003          0185                  CLRF PORTA                 
       5    004          1683                  BSF STATUS, 0x5            
       6    005          1703                  BSF STATUS, 0x6            
       7    006          0188                  CLRF PORTD                 
       8    007          1303                  BCF STATUS, 0x6            
       9    008          30FF                  MOVLW 0xFF                 
      10    009          0085                  MOVWF PORTA                
      11    00A          1283                  BCF STATUS, 0x5            
      12    00B          1283                  BCF STATUS, 0x5            
      13    00C          1303                  BCF STATUS, 0x6            
      14    00D          0186                  CLRF PORTB                 
      15    00E          1703                  BSF STATUS, 0x6            
      16    00F          1683                  BSF STATUS, 0x5            
      17    010          0189                  CLRF PORTE                 
      18    011          1303                  BCF STATUS, 0x6            
      19    012          1683                  BSF STATUS, 0x5            
      20    013          30FF                  MOVLW 0xFF                 
      21    014          0086                  MOVWF PORTB                
      22    015          1283                  BCF STATUS, 0x5            
      23    016          0187                  CLRF PORTC                 
      24    017          1683                  BSF STATUS, 0x5            
      25    018          3000                  MOVLW 0x0                  
      26    019          0087                  MOVWF PORTC                
      27    01A          1283                  BCF STATUS, 0x5            
      28    01B          0188                  CLRF PORTD                 
      29    01C          1683                  BSF STATUS, 0x5            
      30    01D          3000                  MOVLW 0x0                  
      31    01E          0088                  MOVWF PORTD                
      32    01F          1283                  BCF STATUS, 0x5            
      33    020          170F                  BSF TMR1H, 0x6             
      34    021          168F                  BSF TMR1H, 0x5             
      35    022          120F                  BCF TMR1H, 0x4             
      36    023          100F                  BCF TMR1H, 0x0             
      37    024          1283                  BCF STATUS, 0x5            
      38    025          1985                  BTFSC PORTA, 0x3           
      39    026          2828                  GOTO 0x28                  
      40    027          287C                  GOTO 0x7C                  
      41    028          249D                  CALL 0x49D                 
      42    029          1683                  BSF STATUS, 0x5            
      43    02A          1281                  BCF TMR0, 0x5              
      44    02B          1283                  BCF STATUS, 0x5            
      45    02C          3001                  MOVLW 0x1                  
      46    02D          00C5                  MOVWF 0x45                 
      47    02E          3049                  MOVLW 0x49                 
      48    02F          0084                  MOVWF FSR                  
      49    030          248D                  CALL 0x48D                 
      50    031          1943                  BTFSC 0x43, 0x2            
      51    032          285C                  GOTO 0x5C                  
      52    033          2248                  CALL 0x248                 
      53    034          1C43                  BTFSS 0x43, 0x0            
      54    035          2830                  GOTO 0x30                  
      55    036          083C                  MOVF 0x3C, W               
      56    037          00C8                  MOVWF 0x48                 
      57    038          0080                  MOVWF INDF                 
      58    039          0A84                  INCF FSR, F                
      59    03A          21C4                  CALL 0x1C4                 
      60    03B          0841                  MOVF 0x41, W               
      61    03C          00C7                  MOVWF 0x47                 
      62    03D          09C7                  COMF 0x47, F               
      63    03E          0848                  MOVF 0x48, W               
      64    03F          07C7                  ADDWF 0x47, F              
      65    040          0FC7                  INCFSZ 0x47, F             
      66    041          2846                  GOTO 0x46                  
      67    042          2843                  GOTO 0x43                  
      68    043          083C                  MOVF 0x3C, W               
      69    044          00C8                  MOVWF 0x48                 
      70    045          283A                  GOTO 0x3A                  
      71    046          0841                  MOVF 0x41, W               
      72    047          0080                  MOVWF INDF                 
      73    048          0A84                  INCF FSR, F                
      74    049          2388                  CALL 0x388                 
      75    04A          2375                  CALL 0x375                 
      76    04B          21FC                  CALL 0x1FC                 
      77    04C          24AB                  CALL 0x4AB                 
      78    04D          30EB                  MOVLW 0xEB                 
      79    04E          07C5                  ADDWF 0x45, F              
      80    04F          0AC5                  INCF 0x45, F               
      81    050          1903                  BTFSC STATUS, 0x2          
      82    051          2855                  GOTO 0x55                  
      83    052          24AE                  CALL 0x4AE                 
      84    053          0AC5                  INCF 0x45, F               
      85    054          2830                  GOTO 0x30                  
      86    055          21FC                  CALL 0x1FC                 
      87    056          2496                  CALL 0x496                 
      88    057          248D                  CALL 0x48D                 
      89    058          1D43                  BTFSS 0x43, 0x2            
      90    059          2856                  GOTO 0x56                  
      91    05A          3015                  MOVLW 0x15                 
      92    05B          00C5                  MOVWF 0x45                 
      93    05C          24A4                  CALL 0x4A4                 
      94    05D          03C5                  DECF 0x45, F               
      95    05E          304A                  MOVLW 0x4A                 
      96    05F          0084                  MOVWF FSR                  
      97    060          2248                  CALL 0x248                 
      98    061          1C43                  BTFSS 0x43, 0x0            
      99    062          2860                  GOTO 0x60                  
     100    063          09BC                  COMF 0x3C, F               
     101    064          0800                  MOVF INDF, W               
     102    065          07BC                  ADDWF 0x3C, F              
     103    066          0ABC                  INCF 0x3C, F               
     104    067          1903                  BTFSC STATUS, 0x2          
     105    068          286F                  GOTO 0x6F                  
     106    069          21C4                  CALL 0x1C4                 
     107    06A          2388                  CALL 0x388                 
     108    06B          2375                  CALL 0x375                 
     109    06C          21FC                  CALL 0x1FC                 
     110    06D          0384                  DECF FSR, F                
     111    06E          2875                  GOTO 0x75                  
     112    06F          0384                  DECF FSR, F                
     113    070          0800                  MOVF INDF, W               
     114    071          00C1                  MOVWF 0x41                 
     115    072          2388                  CALL 0x388                 
     116    073          2375                  CALL 0x375                 
     117    074          21FC                  CALL 0x1FC                 
     118    075          03C5                  DECF 0x45, F               
     119    076          1903                  BTFSC STATUS, 0x2          
     120    077          2828                  GOTO 0x28                  
     121    078          0A84                  INCF FSR, F                
     122    079          0A84                  INCF FSR, F                
     123    07A          0A84                  INCF FSR, F                
     124    07B          2860                  GOTO 0x60                  
     125    07C          24B1                  CALL 0x4B1                 
     126    07D          1008                  BCF PORTD, 0x0             
     127    07E          1488                  BSF PORTD, 0x1             
     128    07F          1508                  BSF PORTD, 0x2             
     129    080          1806                  BTFSC PORTB, 0x0           
     130    081          288B                  GOTO 0x8B                  
     131    082          0F20                  INCFSZ 0x20, W             
     132    083          00A0                  MOVWF 0x20                 
     133    084          1FA0                  BTFSS 0x20, 0x7            
     134    085          288B                  GOTO 0x8B                  
     135    086          1507                  BSF PORTC, 0x2             
     136    087          1688                  BSF PORTD, 0x5             
     137    088          1C06                  BTFSS PORTB, 0x0           
     138    089          2888                  GOTO 0x88                  
     139    08A          29A5                  GOTO 0x1A5                 
     140    08B          1886                  BTFSC PORTB, 0x1           
     141    08C          2896                  GOTO 0x96                  
     142    08D          0F21                  INCFSZ 0x21, W             
     143    08E          00A1                  MOVWF 0x21                 
     144    08F          1FA1                  BTFSS 0x21, 0x7            
     145    090          2896                  GOTO 0x96                  
     146    091          1487                  BSF PORTC, 0x1             
     147    092          1688                  BSF PORTD, 0x5             
     148    093          1C86                  BTFSS PORTB, 0x1           
     149    094          2893                  GOTO 0x93                  
     150    095          29A5                  GOTO 0x1A5                 
     151    096          1906                  BTFSC PORTB, 0x2           
     152    097          28A1                  GOTO 0xA1                  
     153    098          0F22                  INCFSZ 0x22, W             
     154    099          00A2                  MOVWF 0x22                 
     155    09A          1FA2                  BTFSS 0x22, 0x7            
     156    09B          28A1                  GOTO 0xA1                  
     157    09C          1407                  BSF PORTC, 0x0             
     158    09D          1688                  BSF PORTD, 0x5             
     159    09E          1D06                  BTFSS PORTB, 0x2           
     160    09F          289E                  GOTO 0x9E                  
     161    0A0          29A5                  GOTO 0x1A5                 
     162    0A1          1986                  BTFSC PORTB, 0x3           
     163    0A2          28AC                  GOTO 0xAC                  
     164    0A3          0F23                  INCFSZ 0x23, W             
     165    0A4          00A3                  MOVWF 0x23                 
     166    0A5          1FA3                  BTFSS 0x23, 0x7            
     167    0A6          28AC                  GOTO 0xAC                  
     168    0A7          1607                  BSF PORTC, 0x4             
     169    0A8          1688                  BSF PORTD, 0x5             
     170    0A9          1D86                  BTFSS PORTB, 0x3           
     171    0AA          28A9                  GOTO 0xA9                  
     172    0AB          29A5                  GOTO 0x1A5                 
     173    0AC          1A06                  BTFSC PORTB, 0x4           
     174    0AD          28B7                  GOTO 0xB7                  
     175    0AE          0F24                  INCFSZ 0x24, W             
     176    0AF          00A4                  MOVWF 0x24                 
     177    0B0          1FA4                  BTFSS 0x24, 0x7            
     178    0B1          28B7                  GOTO 0xB7                  
     179    0B2          1687                  BSF PORTC, 0x5             
     180    0B3          1688                  BSF PORTD, 0x5             
     181    0B4          1E06                  BTFSS PORTB, 0x4           
     182    0B5          28B4                  GOTO 0xB4                  
     183    0B6          29A5                  GOTO 0x1A5                 
     184    0B7          1A86                  BTFSC PORTB, 0x5           
     185    0B8          28C2                  GOTO 0xC2                  
     186    0B9          0F25                  INCFSZ 0x25, W             
     187    0BA          00A5                  MOVWF 0x25                 
     188    0BB          1FA5                  BTFSS 0x25, 0x7            
     189    0BC          28C2                  GOTO 0xC2                  
     190    0BD          1707                  BSF PORTC, 0x6             
     191    0BE          1688                  BSF PORTD, 0x5             
     192    0BF          1E86                  BTFSS PORTB, 0x5           
     193    0C0          28BF                  GOTO 0xBF                  
     194    0C1          29A5                  GOTO 0x1A5                 
     195    0C2          1805                  BTFSC PORTA, 0x0           
     196    0C3          28CD                  GOTO 0xCD                  
     197    0C4          0F26                  INCFSZ 0x26, W             
     198    0C5          00A6                  MOVWF 0x26                 
     199    0C6          1FA6                  BTFSS 0x26, 0x7            
     200    0C7          28CD                  GOTO 0xCD                  
     201    0C8          1787                  BSF PORTC, 0x7             
     202    0C9          1688                  BSF PORTD, 0x5             
     203    0CA          1C05                  BTFSS PORTA, 0x0           
     204    0CB          28CA                  GOTO 0xCA                  
     205    0CC          29A5                  GOTO 0x1A5                 
     206    0CD          1885                  BTFSC PORTA, 0x1           
     207    0CE          28D8                  GOTO 0xD8                  
     208    0CF          0F27                  INCFSZ 0x27, W             
     209    0D0          00A7                  MOVWF 0x27                 
     210    0D1          1FA7                  BTFSS 0x27, 0x7            
     211    0D2          28D8                  GOTO 0xD8                  
     212    0D3          1608                  BSF PORTD, 0x4             
     213    0D4          1688                  BSF PORTD, 0x5             
     214    0D5          1C85                  BTFSS PORTA, 0x1           
     215    0D6          28D5                  GOTO 0xD5                  
     216    0D7          29A5                  GOTO 0x1A5                 
     217    0D8          1905                  BTFSC PORTA, 0x2           
     218    0D9          28E3                  GOTO 0xE3                  
     219    0DA          0F28                  INCFSZ 0x28, W             
     220    0DB          00A8                  MOVWF 0x28                 
     221    0DC          1FA8                  BTFSS 0x28, 0x7            
     222    0DD          28E3                  GOTO 0xE3                  
     223    0DE          1587                  BSF PORTC, 0x3             
     224    0DF          1688                  BSF PORTD, 0x5             
     225    0E0          1D05                  BTFSS PORTA, 0x2           
     226    0E1          28E0                  GOTO 0xE0                  
     227    0E2          29A5                  GOTO 0x1A5                 
     228    0E3          1408                  BSF PORTD, 0x0             
     229    0E4          1088                  BCF PORTD, 0x1             
     230    0E5          1508                  BSF PORTD, 0x2             
     231    0E6          1886                  BTFSC PORTB, 0x1           
     232    0E7          28F1                  GOTO 0xF1                  
     233    0E8          0F29                  INCFSZ 0x29, W             
     234    0E9          00A9                  MOVWF 0x29                 
     235    0EA          1FA9                  BTFSS 0x29, 0x7            
     236    0EB          28F1                  GOTO 0xF1                  
     237    0EC          1507                  BSF PORTC, 0x2             
     238    0ED          1708                  BSF PORTD, 0x6             
     239    0EE          1C86                  BTFSS PORTB, 0x1           
     240    0EF          28EE                  GOTO 0xEE                  
     241    0F0          29A5                  GOTO 0x1A5                 
     242    0F1          1906                  BTFSC PORTB, 0x2           
     243    0F2          28FC                  GOTO 0xFC                  
     244    0F3          0F2A                  INCFSZ 0x2A, W             
     245    0F4          00AA                  MOVWF 0x2A                 
     246    0F5          1FAA                  BTFSS 0x2A, 0x7            
     247    0F6          28FC                  GOTO 0xFC                  
     248    0F7          1487                  BSF PORTC, 0x1             
     249    0F8          1708                  BSF PORTD, 0x6             
     250    0F9          1D06                  BTFSS PORTB, 0x2           
     251    0FA          28F9                  GOTO 0xF9                  
     252    0FB          29A5                  GOTO 0x1A5                 
     253    0FC          1986                  BTFSC PORTB, 0x3           
     254    0FD          2907                  GOTO 0x107                 
     255    0FE          0F2B                  INCFSZ 0x2B, W             
     256    0FF          00AB                  MOVWF 0x2B                 
     257    100          1FAB                  BTFSS 0x2B, 0x7            
     258    101          2907                  GOTO 0x107                 
     259    102          1407                  BSF PORTC, 0x0             
     260    103          1708                  BSF PORTD, 0x6             
     261    104          1D86                  BTFSS PORTB, 0x3           
     262    105          2904                  GOTO 0x104                 
     263    106          29A5                  GOTO 0x1A5                 
     264    107          1A06                  BTFSC PORTB, 0x4           
     265    108          2912                  GOTO 0x112                 
     266    109          0F2C                  INCFSZ 0x2C, W             
     267    10A          00AC                  MOVWF 0x2C                 
     268    10B          1FAC                  BTFSS 0x2C, 0x7            
     269    10C          2912                  GOTO 0x112                 
     270    10D          1607                  BSF PORTC, 0x4             
     271    10E          1708                  BSF PORTD, 0x6             
     272    10F          1E06                  BTFSS PORTB, 0x4           
     273    110          290F                  GOTO 0x10F                 
     274    111          29A5                  GOTO 0x1A5                 
     275    112          1A86                  BTFSC PORTB, 0x5           
     276    113          291D                  GOTO 0x11D                 
     277    114          0F2D                  INCFSZ 0x2D, W             
     278    115          00AD                  MOVWF 0x2D                 
     279    116          1FAD                  BTFSS 0x2D, 0x7            
     280    117          291D                  GOTO 0x11D                 
     281    118          1687                  BSF PORTC, 0x5             
     282    119          1708                  BSF PORTD, 0x6             
     283    11A          1E86                  BTFSS PORTB, 0x5           
     284    11B          291A                  GOTO 0x11A                 
     285    11C          29A5                  GOTO 0x1A5                 
     286    11D          1805                  BTFSC PORTA, 0x0           
     287    11E          2928                  GOTO 0x128                 
     288    11F          0F2E                  INCFSZ 0x2E, W             
     289    120          00AE                  MOVWF 0x2E                 
     290    121          1FAE                  BTFSS 0x2E, 0x7            
     291    122          2928                  GOTO 0x128                 
     292    123          1707                  BSF PORTC, 0x6             
     293    124          1708                  BSF PORTD, 0x6             
     294    125          1C05                  BTFSS PORTA, 0x0           
     295    126          2925                  GOTO 0x125                 
     296    127          29A5                  GOTO 0x1A5                 
     297    128          1885                  BTFSC PORTA, 0x1           
     298    129          2933                  GOTO 0x133                 
     299    12A          0F2F                  INCFSZ 0x2F, W             
     300    12B          00AF                  MOVWF 0x2F                 
     301    12C          1FAF                  BTFSS 0x2F, 0x7            
     302    12D          2933                  GOTO 0x133                 
     303    12E          1787                  BSF PORTC, 0x7             
     304    12F          1708                  BSF PORTD, 0x6             
     305    130          1C85                  BTFSS PORTA, 0x1           
     306    131          2930                  GOTO 0x130                 
     307    132          29A5                  GOTO 0x1A5                 
     308    133          1905                  BTFSC PORTA, 0x2           
     309    134          293E                  GOTO 0x13E                 
     310    135          0F30                  INCFSZ 0x30, W             
     311    136          00B0                  MOVWF 0x30                 
     312    137          1FB0                  BTFSS 0x30, 0x7            
     313    138          293E                  GOTO 0x13E                 
     314    139          1608                  BSF PORTD, 0x4             
     315    13A          1708                  BSF PORTD, 0x6             
     316    13B          1D05                  BTFSS PORTA, 0x2           
     317    13C          293B                  GOTO 0x13B                 
     318    13D          29A5                  GOTO 0x1A5                 
     319    13E          1408                  BSF PORTD, 0x0             
     320    13F          1488                  BSF PORTD, 0x1             
     321    140          1108                  BCF PORTD, 0x2             
     322    141          1806                  BTFSC PORTB, 0x0           
     323    142          294C                  GOTO 0x14C                 
     324    143          0F31                  INCFSZ 0x31, W             
     325    144          00B1                  MOVWF 0x31                 
     326    145          1FB1                  BTFSS 0x31, 0x7            
     327    146          294C                  GOTO 0x14C                 
     328    147          1507                  BSF PORTC, 0x2             
     329    148          1788                  BSF PORTD, 0x7             
     330    149          1C06                  BTFSS PORTB, 0x0           
     331    14A          2949                  GOTO 0x149                 
     332    14B          29A5                  GOTO 0x1A5                 
     333    14C          1886                  BTFSC PORTB, 0x1           
     334    14D          2957                  GOTO 0x157                 
     335    14E          0F32                  INCFSZ 0x32, W             
     336    14F          00B2                  MOVWF 0x32                 
     337    150          1FB2                  BTFSS 0x32, 0x7            
     338    151          2957                  GOTO 0x157                 
     339    152          1487                  BSF PORTC, 0x1             
     340    153          1788                  BSF PORTD, 0x7             
     341    154          1C86                  BTFSS PORTB, 0x1           
     342    155          2954                  GOTO 0x154                 
     343    156          29A5                  GOTO 0x1A5                 
     344    157          1906                  BTFSC PORTB, 0x2           
     345    158          2962                  GOTO 0x162                 
     346    159          0F33                  INCFSZ 0x33, W             
     347    15A          00B3                  MOVWF 0x33                 
     348    15B          1FB3                  BTFSS 0x33, 0x7            
     349    15C          2962                  GOTO 0x162                 
     350    15D          1407                  BSF PORTC, 0x0             
     351    15E          1788                  BSF PORTD, 0x7             
     352    15F          1D06                  BTFSS PORTB, 0x2           
     353    160          295F                  GOTO 0x15F                 
     354    161          29A5                  GOTO 0x1A5                 
     355    162          1986                  BTFSC PORTB, 0x3           
     356    163          296D                  GOTO 0x16D                 
     357    164          0F34                  INCFSZ 0x34, W             
     358    165          00B4                  MOVWF 0x34                 
     359    166          1FB4                  BTFSS 0x34, 0x7            
     360    167          296D                  GOTO 0x16D                 
     361    168          1607                  BSF PORTC, 0x4             
     362    169          1788                  BSF PORTD, 0x7             
     363    16A          1D86                  BTFSS PORTB, 0x3           
     364    16B          296A                  GOTO 0x16A                 
     365    16C          29A5                  GOTO 0x1A5                 
     366    16D          1A06                  BTFSC PORTB, 0x4           
     367    16E          2978                  GOTO 0x178                 
     368    16F          0F35                  INCFSZ 0x35, W             
     369    170          00B5                  MOVWF 0x35                 
     370    171          1FB5                  BTFSS 0x35, 0x7            
     371    172          2978                  GOTO 0x178                 
     372    173          1687                  BSF PORTC, 0x5             
     373    174          1788                  BSF PORTD, 0x7             
     374    175          1E06                  BTFSS PORTB, 0x4           
     375    176          2975                  GOTO 0x175                 
     376    177          29A5                  GOTO 0x1A5                 
     377    178          1A86                  BTFSC PORTB, 0x5           
     378    179          2983                  GOTO 0x183                 
     379    17A          0F36                  INCFSZ 0x36, W             
     380    17B          00B6                  MOVWF 0x36                 
     381    17C          1FB6                  BTFSS 0x36, 0x7            
     382    17D          2983                  GOTO 0x183                 
     383    17E          1707                  BSF PORTC, 0x6             
     384    17F          1788                  BSF PORTD, 0x7             
     385    180          1E86                  BTFSS PORTB, 0x5           
     386    181          2980                  GOTO 0x180                 
     387    182          29A5                  GOTO 0x1A5                 
     388    183          1805                  BTFSC PORTA, 0x0           
     389    184          298E                  GOTO 0x18E                 
     390    185          0F37                  INCFSZ 0x37, W             
     391    186          00B7                  MOVWF 0x37                 
     392    187          1FB7                  BTFSS 0x37, 0x7            
     393    188          298E                  GOTO 0x18E                 
     394    189          1787                  BSF PORTC, 0x7             
     395    18A          1788                  BSF PORTD, 0x7             
     396    18B          1C05                  BTFSS PORTA, 0x0           
     397    18C          298B                  GOTO 0x18B                 
     398    18D          29A5                  GOTO 0x1A5                 
     399    18E          1885                  BTFSC PORTA, 0x1           
     400    18F          2999                  GOTO 0x199                 
     401    190          0F38                  INCFSZ 0x38, W             
     402    191          00B8                  MOVWF 0x38                 
     403    192          1FB8                  BTFSS 0x38, 0x7            
     404    193          2999                  GOTO 0x199                 
     405    194          1608                  BSF PORTD, 0x4             
     406    195          1788                  BSF PORTD, 0x7             
     407    196          1C85                  BTFSS PORTA, 0x1           
     408    197          2996                  GOTO 0x196                 
     409    198          29A5                  GOTO 0x1A5                 
     410    199          1905                  BTFSC PORTA, 0x2           
     411    19A          29A4                  GOTO 0x1A4                 
     412    19B          0F39                  INCFSZ 0x39, W             
     413    19C          00B9                  MOVWF 0x39                 
     414    19D          1FB9                  BTFSS 0x39, 0x7            
     415    19E          29A4                  GOTO 0x1A4                 
     416    19F          1587                  BSF PORTC, 0x3             
     417    1A0          1788                  BSF PORTD, 0x7             
     418    1A1          1D05                  BTFSS PORTA, 0x2           
     419    1A2          29A1                  GOTO 0x1A1                 
     420    1A3          29A5                  GOTO 0x1A5                 
     421    1A4          287D                  GOTO 0x7D                  
     422    1A5          21FC                  CALL 0x1FC                 
     423    1A6          21A8                  CALL 0x1A8                 
     424    1A7          287D                  GOTO 0x7D                  
     425    1A8          01A0                  CLRF 0x20                  
     426    1A9          01A1                  CLRF 0x21                  
     427    1AA          01A2                  CLRF 0x22                  
     428    1AB          01A3                  CLRF 0x23                  
     429    1AC          01A4                  CLRF 0x24                  
     430    1AD          01A5                  CLRF 0x25                  
     431    1AE          01A6                  CLRF 0x26                  
     432    1AF          01A7                  CLRF 0x27                  
     433    1B0          01A8                  CLRF 0x28                  
     434    1B1          01A9                  CLRF 0x29                  
     435    1B2          01AA                  CLRF 0x2A                  
     436    1B3          01AB                  CLRF 0x2B                  
     437    1B4          01AC                  CLRF 0x2C                  
     438    1B5          01AD                  CLRF 0x2D                  
     439    1B6          01AE                  CLRF 0x2E                  
     440    1B7          01AF                  CLRF 0x2F                  
     441    1B8          01B0                  CLRF 0x30                  
     442    1B9          01B1                  CLRF 0x31                  
     443    1BA          01B2                  CLRF 0x32                  
     444    1BB          01B3                  CLRF 0x33                  
     445    1BC          01B4                  CLRF 0x34                  
     446    1BD          01B5                  CLRF 0x35                  
     447    1BE          01B6                  CLRF 0x36                  
     448    1BF          01B7                  CLRF 0x37                  
     449    1C0          01B8                  CLRF 0x38                  
     450    1C1          01B9                  CLRF 0x39                  
     451    1C2          01BA                  CLRF 0x3A                  
     452    1C3          0008                  RETURN                     
     453    1C4          0801                  MOVF TMR0, W               
     454    1C5          00C1                  MOVWF 0x41                 
     455    1C6          301F                  MOVLW 0x1F                 
     456    1C7          0541                  ANDWF 0x41, W              
     457    1C8          00C1                  MOVWF 0x41                 
     458    1C9          3EE6                  ADDLW 0xE6                 
     459    1CA          1803                  BTFSC STATUS, 0x0          
     460    1CB          29CD                  GOTO 0x1CD                 
     461    1CC          29D2                  GOTO 0x1D2                 
     462    1CD          29C4                  GOTO 0x1C4                 
     463    1CE          00C1                  MOVWF 0x41                 
     464    1CF          09C1                  COMF 0x41, F               
     465    1D0          30E0                  MOVLW 0xE0                 
     466    1D1          05C1                  ANDWF 0x41, F              
     467    1D2          0841                  MOVF 0x41, W               
     468    1D3          1903                  BTFSC STATUS, 0x2          
     469    1D4          29C4                  GOTO 0x1C4                 
     470    1D5          0008                  RETURN                     
     471    1D6          1507                  BSF PORTC, 0x2             
     472    1D7          1708                  BSF PORTD, 0x6             
     473    1D8          220C                  CALL 0x20C                 
     474    1D9          1107                  BCF PORTC, 0x2             
     475    1DA          1308                  BCF PORTD, 0x6             
     476    1DB          220C                  CALL 0x20C                 
     477    1DC          1507                  BSF PORTC, 0x2             
     478    1DD          1688                  BSF PORTD, 0x5             
     479    1DE          220C                  CALL 0x20C                 
     480    1DF          1107                  BCF PORTC, 0x2             
     481    1E0          1288                  BCF PORTD, 0x5             
     482    1E1          220C                  CALL 0x20C                 
     483    1E2          220C                  CALL 0x20C                 
     484    1E3          1487                  BSF PORTC, 0x1             
     485    1E4          1688                  BSF PORTD, 0x5             
     486    1E5          220C                  CALL 0x20C                 
     487    1E6          1087                  BCF PORTC, 0x1             
     488    1E7          1288                  BCF PORTD, 0x5             
     489    1E8          220C                  CALL 0x20C                 
     490    1E9          1407                  BSF PORTC, 0x0             
     491    1EA          1688                  BSF PORTD, 0x5             
     492    1EB          220C                  CALL 0x20C                 
     493    1EC          1007                  BCF PORTC, 0x0             
     494    1ED          1288                  BCF PORTD, 0x5             
     495    1EE          220C                  CALL 0x20C                 
     496    1EF          1608                  BSF PORTD, 0x4             
     497    1F0          1688                  BSF PORTD, 0x5             
     498    1F1          220C                  CALL 0x20C                 
     499    1F2          1208                  BCF PORTD, 0x4             
     500    1F3          1288                  BCF PORTD, 0x5             
     501    1F4          220C                  CALL 0x20C                 
     502    1F5          1687                  BSF PORTC, 0x5             
     503    1F6          1688                  BSF PORTD, 0x5             
     504    1F7          220C                  CALL 0x20C                 
     505    1F8          1287                  BCF PORTC, 0x5             
     506    1F9          1288                  BCF PORTD, 0x5             
     507    1FA          220C                  CALL 0x20C                 
     508    1FB          29DC                  GOTO 0x1DC                 
     509    1FC          0188                  CLRF PORTD                 
     510    1FD          0187                  CLRF PORTC                 
     511    1FE          0008                  RETURN                     
     512    1FF          1008                  BCF PORTD, 0x0             
     513    200          1088                  BCF PORTD, 0x1             
     514    201          1108                  BCF PORTD, 0x2             
     515    202          1107                  BCF PORTC, 0x2             
     516    203          1087                  BCF PORTC, 0x1             
     517    204          1007                  BCF PORTC, 0x0             
     518    205          1208                  BCF PORTD, 0x4             
     519    206          1287                  BCF PORTC, 0x5             
     520    207          1307                  BCF PORTC, 0x6             
     521    208          1387                  BCF PORTC, 0x7             
     522    209          1207                  BCF PORTC, 0x4             
     523    20A          1187                  BCF PORTC, 0x3             
     524    20B          0008                  RETURN                     
     525    20C          3064                  MOVLW 0x64                 
     526    20D          00BF                  MOVWF 0x3F                 
     527    20E          3028                  MOVLW 0x28                 
     528    20F          00BE                  MOVWF 0x3E                 
     529    210          3028                  MOVLW 0x28                 
     530    211          00BD                  MOVWF 0x3D                 
     531    212          0BBD                  DECFSZ 0x3D, F             
     532    213          2A12                  GOTO 0x212                 
     533    214          0BBE                  DECFSZ 0x3E, F             
     534    215          2A10                  GOTO 0x210                 
     535    216          0BBF                  DECFSZ 0x3F, F             
     536    217          2A0E                  GOTO 0x20E                 
     537    218          0008                  RETURN                     
     538    219          300A                  MOVLW 0xA                  
     539    21A          00BF                  MOVWF 0x3F                 
     540    21B          3028                  MOVLW 0x28                 
     541    21C          00BE                  MOVWF 0x3E                 
     542    21D          3028                  MOVLW 0x28                 
     543    21E          00BD                  MOVWF 0x3D                 
     544    21F          0BBD                  DECFSZ 0x3D, F             
     545    220          2A1F                  GOTO 0x21F                 
     546    221          0BBE                  DECFSZ 0x3E, F             
     547    222          2A1D                  GOTO 0x21D                 
     548    223          0BBF                  DECFSZ 0x3F, F             
     549    224          2A1B                  GOTO 0x21B                 
     550    225          0008                  RETURN                     
     551    226          302D                  MOVLW 0x2D                 
     552    227          00BF                  MOVWF 0x3F                 
     553    228          3028                  MOVLW 0x28                 
     554    229          00BE                  MOVWF 0x3E                 
     555    22A          3028                  MOVLW 0x28                 
     556    22B          00BD                  MOVWF 0x3D                 
     557    22C          0BBD                  DECFSZ 0x3D, F             
     558    22D          2A2C                  GOTO 0x22C                 
     559    22E          0BBE                  DECFSZ 0x3E, F             
     560    22F          2A2A                  GOTO 0x22A                 
     561    230          0BBF                  DECFSZ 0x3F, F             
     562    231          2A28                  GOTO 0x228                 
     563    232          0008                  RETURN                     
     564    233          1507                  BSF PORTC, 0x2             
     565    234          1788                  BSF PORTD, 0x7             
     566    235          220C                  CALL 0x20C                 
     567    236          1107                  BCF PORTC, 0x2             
     568    237          1388                  BCF PORTD, 0x7             
     569    238          220C                  CALL 0x20C                 
     570    239          2A33                  GOTO 0x233                 
     571    23A          1487                  BSF PORTC, 0x1             
     572    23B          1788                  BSF PORTD, 0x7             
     573    23C          220C                  CALL 0x20C                 
     574    23D          1087                  BCF PORTC, 0x1             
     575    23E          1388                  BCF PORTD, 0x7             
     576    23F          220C                  CALL 0x20C                 
     577    240          2A3A                  GOTO 0x23A                 
     578    241          1407                  BSF PORTC, 0x0             
     579    242          1788                  BSF PORTD, 0x7             
     580    243          220C                  CALL 0x20C                 
     581    244          1007                  BCF PORTC, 0x0             
     582    245          1388                  BCF PORTD, 0x7             
     583    246          220C                  CALL 0x20C                 
     584    247          0008                  RETURN                     
     585    248          1043                  BCF 0x43, 0x0              
     586    249          1008                  BCF PORTD, 0x0             
     587    24A          1488                  BSF PORTD, 0x1             
     588    24B          1508                  BSF PORTD, 0x2             
     589    24C          1806                  BTFSC PORTB, 0x0           
     590    24D          2A57                  GOTO 0x257                 
     591    24E          0F20                  INCFSZ 0x20, W             
     592    24F          00A0                  MOVWF 0x20                 
     593    250          1FA0                  BTFSS 0x20, 0x7            
     594    251          2A57                  GOTO 0x257                 
     595    252          1F20                  BTFSS 0x20, 0x6            
     596    253          2A57                  GOTO 0x257                 
     597    254          3001                  MOVLW 0x1                  
     598    255          00BC                  MOVWF 0x3C                 
     599    256          2B72                  GOTO 0x372                 
     600    257          1886                  BTFSC PORTB, 0x1           
     601    258          2A62                  GOTO 0x262                 
     602    259          0F21                  INCFSZ 0x21, W             
     603    25A          00A1                  MOVWF 0x21                 
     604    25B          1FA1                  BTFSS 0x21, 0x7            
     605    25C          2A62                  GOTO 0x262                 
     606    25D          1F21                  BTFSS 0x21, 0x6            
     607    25E          2A62                  GOTO 0x262                 
     608    25F          3002                  MOVLW 0x2                  
     609    260          00BC                  MOVWF 0x3C                 
     610    261          2B72                  GOTO 0x372                 
     611    262          1906                  BTFSC PORTB, 0x2           
     612    263          2A6D                  GOTO 0x26D                 
     613    264          0F22                  INCFSZ 0x22, W             
     614    265          00A2                  MOVWF 0x22                 
     615    266          1FA2                  BTFSS 0x22, 0x7            
     616    267          2A6D                  GOTO 0x26D                 
     617    268          1F22                  BTFSS 0x22, 0x6            
     618    269          2A6D                  GOTO 0x26D                 
     619    26A          3003                  MOVLW 0x3                  
     620    26B          00BC                  MOVWF 0x3C                 
     621    26C          2B72                  GOTO 0x372                 
     622    26D          1986                  BTFSC PORTB, 0x3           
     623    26E          2A78                  GOTO 0x278                 
     624    26F          0F23                  INCFSZ 0x23, W             
     625    270          00A3                  MOVWF 0x23                 
     626    271          1FA3                  BTFSS 0x23, 0x7            
     627    272          2A78                  GOTO 0x278                 
     628    273          1F23                  BTFSS 0x23, 0x6            
     629    274          2A78                  GOTO 0x278                 
     630    275          3004                  MOVLW 0x4                  
     631    276          00BC                  MOVWF 0x3C                 
     632    277          2B72                  GOTO 0x372                 
     633    278          1A06                  BTFSC PORTB, 0x4           
     634    279          2A83                  GOTO 0x283                 
     635    27A          0F24                  INCFSZ 0x24, W             
     636    27B          00A4                  MOVWF 0x24                 
     637    27C          1FA4                  BTFSS 0x24, 0x7            
     638    27D          2A83                  GOTO 0x283                 
     639    27E          1F24                  BTFSS 0x24, 0x6            
     640    27F          2A83                  GOTO 0x283                 
     641    280          3005                  MOVLW 0x5                  
     642    281          00BC                  MOVWF 0x3C                 
     643    282          2B72                  GOTO 0x372                 
     644    283          1A86                  BTFSC PORTB, 0x5           
     645    284          2A8E                  GOTO 0x28E                 
     646    285          0F25                  INCFSZ 0x25, W             
     647    286          00A5                  MOVWF 0x25                 
     648    287          1FA5                  BTFSS 0x25, 0x7            
     649    288          2A8E                  GOTO 0x28E                 
     650    289          1F25                  BTFSS 0x25, 0x6            
     651    28A          2A8E                  GOTO 0x28E                 
     652    28B          3006                  MOVLW 0x6                  
     653    28C          00BC                  MOVWF 0x3C                 
     654    28D          2B72                  GOTO 0x372                 
     655    28E          1805                  BTFSC PORTA, 0x0           
     656    28F          2A99                  GOTO 0x299                 
     657    290          0F26                  INCFSZ 0x26, W             
     658    291          00A6                  MOVWF 0x26                 
     659    292          1FA6                  BTFSS 0x26, 0x7            
     660    293          2A99                  GOTO 0x299                 
     661    294          1F26                  BTFSS 0x26, 0x6            
     662    295          2A99                  GOTO 0x299                 
     663    296          3007                  MOVLW 0x7                  
     664    297          00BC                  MOVWF 0x3C                 
     665    298          2B72                  GOTO 0x372                 
     666    299          1885                  BTFSC PORTA, 0x1           
     667    29A          2AA4                  GOTO 0x2A4                 
     668    29B          0F27                  INCFSZ 0x27, W             
     669    29C          00A7                  MOVWF 0x27                 
     670    29D          1FA7                  BTFSS 0x27, 0x7            
     671    29E          2AA4                  GOTO 0x2A4                 
     672    29F          1F27                  BTFSS 0x27, 0x6            
     673    2A0          2AA4                  GOTO 0x2A4                 
     674    2A1          3008                  MOVLW 0x8                  
     675    2A2          00BC                  MOVWF 0x3C                 
     676    2A3          2B72                  GOTO 0x372                 
     677    2A4          1905                  BTFSC PORTA, 0x2           
     678    2A5          2AAF                  GOTO 0x2AF                 
     679    2A6          0F28                  INCFSZ 0x28, W             
     680    2A7          00A8                  MOVWF 0x28                 
     681    2A8          1FA8                  BTFSS 0x28, 0x7            
     682    2A9          2AAF                  GOTO 0x2AF                 
     683    2AA          1F28                  BTFSS 0x28, 0x6            
     684    2AB          2AAF                  GOTO 0x2AF                 
     685    2AC          3009                  MOVLW 0x9                  
     686    2AD          00BC                  MOVWF 0x3C                 
     687    2AE          2B72                  GOTO 0x372                 
     688    2AF          3000                  MOVLW 0x0                  
     689    2B0          00BC                  MOVWF 0x3C                 
     690    2B1          1408                  BSF PORTD, 0x0             
     691    2B2          1088                  BCF PORTD, 0x1             
     692    2B3          1508                  BSF PORTD, 0x2             
     693    2B4          1886                  BTFSC PORTB, 0x1           
     694    2B5          2ABF                  GOTO 0x2BF                 
     695    2B6          0F29                  INCFSZ 0x29, W             
     696    2B7          00A9                  MOVWF 0x29                 
     697    2B8          1FA9                  BTFSS 0x29, 0x7            
     698    2B9          2ABF                  GOTO 0x2BF                 
     699    2BA          1F29                  BTFSS 0x29, 0x6            
     700    2BB          2ABF                  GOTO 0x2BF                 
     701    2BC          300A                  MOVLW 0xA                  
     702    2BD          00BC                  MOVWF 0x3C                 
     703    2BE          2B72                  GOTO 0x372                 
     704    2BF          1906                  BTFSC PORTB, 0x2           
     705    2C0          2ACA                  GOTO 0x2CA                 
     706    2C1          0F2A                  INCFSZ 0x2A, W             
     707    2C2          00AA                  MOVWF 0x2A                 
     708    2C3          1FAA                  BTFSS 0x2A, 0x7            
     709    2C4          2ACA                  GOTO 0x2CA                 
     710    2C5          1F2A                  BTFSS 0x2A, 0x6            
     711    2C6          2ACA                  GOTO 0x2CA                 
     712    2C7          300B                  MOVLW 0xB                  
     713    2C8          00BC                  MOVWF 0x3C                 
     714    2C9          2B72                  GOTO 0x372                 
     715    2CA          1986                  BTFSC PORTB, 0x3           
     716    2CB          2AD5                  GOTO 0x2D5                 
     717    2CC          0F2B                  INCFSZ 0x2B, W             
     718    2CD          00AB                  MOVWF 0x2B                 
     719    2CE          1FAB                  BTFSS 0x2B, 0x7            
     720    2CF          2AD5                  GOTO 0x2D5                 
     721    2D0          1F2B                  BTFSS 0x2B, 0x6            
     722    2D1          2AD5                  GOTO 0x2D5                 
     723    2D2          300C                  MOVLW 0xC                  
     724    2D3          00BC                  MOVWF 0x3C                 
     725    2D4          2B72                  GOTO 0x372                 
     726    2D5          1A06                  BTFSC PORTB, 0x4           
     727    2D6          2AE0                  GOTO 0x2E0                 
     728    2D7          0F2C                  INCFSZ 0x2C, W             
     729    2D8          00AC                  MOVWF 0x2C                 
     730    2D9          1FAC                  BTFSS 0x2C, 0x7            
     731    2DA          2AE0                  GOTO 0x2E0                 
     732    2DB          1F2C                  BTFSS 0x2C, 0x6            
     733    2DC          2AE0                  GOTO 0x2E0                 
     734    2DD          300D                  MOVLW 0xD                  
     735    2DE          00BC                  MOVWF 0x3C                 
     736    2DF          2B72                  GOTO 0x372                 
     737    2E0          1A86                  BTFSC PORTB, 0x5           
     738    2E1          2AEB                  GOTO 0x2EB                 
     739    2E2          0F2D                  INCFSZ 0x2D, W             
     740    2E3          00AD                  MOVWF 0x2D                 
     741    2E4          1FAD                  BTFSS 0x2D, 0x7            
     742    2E5          2AEB                  GOTO 0x2EB                 
     743    2E6          1F2D                  BTFSS 0x2D, 0x6            
     744    2E7          2AEB                  GOTO 0x2EB                 
     745    2E8          300E                  MOVLW 0xE                  
     746    2E9          00BC                  MOVWF 0x3C                 
     747    2EA          2B72                  GOTO 0x372                 
     748    2EB          1805                  BTFSC PORTA, 0x0           
     749    2EC          2AF6                  GOTO 0x2F6                 
     750    2ED          0F2E                  INCFSZ 0x2E, W             
     751    2EE          00AE                  MOVWF 0x2E                 
     752    2EF          1FAE                  BTFSS 0x2E, 0x7            
     753    2F0          2AF6                  GOTO 0x2F6                 
     754    2F1          1F2E                  BTFSS 0x2E, 0x6            
     755    2F2          2AF6                  GOTO 0x2F6                 
     756    2F3          300F                  MOVLW 0xF                  
     757    2F4          00BC                  MOVWF 0x3C                 
     758    2F5          2B72                  GOTO 0x372                 
     759    2F6          1885                  BTFSC PORTA, 0x1           
     760    2F7          2B01                  GOTO 0x301                 
     761    2F8          0F2F                  INCFSZ 0x2F, W             
     762    2F9          00AF                  MOVWF 0x2F                 
     763    2FA          1FAF                  BTFSS 0x2F, 0x7            
     764    2FB          2B01                  GOTO 0x301                 
     765    2FC          1F2F                  BTFSS 0x2F, 0x6            
     766    2FD          2B01                  GOTO 0x301                 
     767    2FE          3010                  MOVLW 0x10                 
     768    2FF          00BC                  MOVWF 0x3C                 
     769    300          2B72                  GOTO 0x372                 
     770    301          1905                  BTFSC PORTA, 0x2           
     771    302          2B0C                  GOTO 0x30C                 
     772    303          0F30                  INCFSZ 0x30, W             
     773    304          00B0                  MOVWF 0x30                 
     774    305          1FB0                  BTFSS 0x30, 0x7            
     775    306          2B0C                  GOTO 0x30C                 
     776    307          1F30                  BTFSS 0x30, 0x6            
     777    308          2B0C                  GOTO 0x30C                 
     778    309          3011                  MOVLW 0x11                 
     779    30A          00BC                  MOVWF 0x3C                 
     780    30B          2B72                  GOTO 0x372                 
     781    30C          1408                  BSF PORTD, 0x0             
     782    30D          1488                  BSF PORTD, 0x1             
     783    30E          1108                  BCF PORTD, 0x2             
     784    30F          1806                  BTFSC PORTB, 0x0           
     785    310          2B1A                  GOTO 0x31A                 
     786    311          0F31                  INCFSZ 0x31, W             
     787    312          00B1                  MOVWF 0x31                 
     788    313          1FB1                  BTFSS 0x31, 0x7            
     789    314          2B1A                  GOTO 0x31A                 
     790    315          1F31                  BTFSS 0x31, 0x6            
     791    316          2B1A                  GOTO 0x31A                 
     792    317          3012                  MOVLW 0x12                 
     793    318          00BC                  MOVWF 0x3C                 
     794    319          2B72                  GOTO 0x372                 
     795    31A          1886                  BTFSC PORTB, 0x1           
     796    31B          2B25                  GOTO 0x325                 
     797    31C          0F32                  INCFSZ 0x32, W             
     798    31D          00B2                  MOVWF 0x32                 
     799    31E          1FB2                  BTFSS 0x32, 0x7            
     800    31F          2B25                  GOTO 0x325                 
     801    320          1F32                  BTFSS 0x32, 0x6            
     802    321          2B25                  GOTO 0x325                 
     803    322          3013                  MOVLW 0x13                 
     804    323          00BC                  MOVWF 0x3C                 
     805    324          2B72                  GOTO 0x372                 
     806    325          1906                  BTFSC PORTB, 0x2           
     807    326          2B30                  GOTO 0x330                 
     808    327          0F33                  INCFSZ 0x33, W             
     809    328          00B3                  MOVWF 0x33                 
     810    329          1FB3                  BTFSS 0x33, 0x7            
     811    32A          2B30                  GOTO 0x330                 
     812    32B          3014                  MOVLW 0x14                 
     813    32C          00BC                  MOVWF 0x3C                 
     814    32D          1F33                  BTFSS 0x33, 0x6            
     815    32E          2B30                  GOTO 0x330                 
     816    32F          2B72                  GOTO 0x372                 
     817    330          1986                  BTFSC PORTB, 0x3           
     818    331          2B3B                  GOTO 0x33B                 
     819    332          0F34                  INCFSZ 0x34, W             
     820    333          00B4                  MOVWF 0x34                 
     821    334          1FB4                  BTFSS 0x34, 0x7            
     822    335          2B3B                  GOTO 0x33B                 
     823    336          1F34                  BTFSS 0x34, 0x6            
     824    337          2B3B                  GOTO 0x33B                 
     825    338          3015                  MOVLW 0x15                 
     826    339          00BC                  MOVWF 0x3C                 
     827    33A          2B72                  GOTO 0x372                 
     828    33B          1A06                  BTFSC PORTB, 0x4           
     829    33C          2B46                  GOTO 0x346                 
     830    33D          0F35                  INCFSZ 0x35, W             
     831    33E          00B5                  MOVWF 0x35                 
     832    33F          1FB5                  BTFSS 0x35, 0x7            
     833    340          2B46                  GOTO 0x346                 
     834    341          1F35                  BTFSS 0x35, 0x6            
     835    342          2B46                  GOTO 0x346                 
     836    343          3016                  MOVLW 0x16                 
     837    344          00BC                  MOVWF 0x3C                 
     838    345          2B72                  GOTO 0x372                 
     839    346          1A86                  BTFSC PORTB, 0x5           
     840    347          2B51                  GOTO 0x351                 
     841    348          0F36                  INCFSZ 0x36, W             
     842    349          00B6                  MOVWF 0x36                 
     843    34A          1FB6                  BTFSS 0x36, 0x7            
     844    34B          2B51                  GOTO 0x351                 
     845    34C          1F36                  BTFSS 0x36, 0x6            
     846    34D          2B51                  GOTO 0x351                 
     847    34E          3017                  MOVLW 0x17                 
     848    34F          00BC                  MOVWF 0x3C                 
     849    350          2B72                  GOTO 0x372                 
     850    351          1805                  BTFSC PORTA, 0x0           
     851    352          2B5C                  GOTO 0x35C                 
     852    353          0F37                  INCFSZ 0x37, W             
     853    354          00B7                  MOVWF 0x37                 
     854    355          1FB7                  BTFSS 0x37, 0x7            
     855    356          2B5C                  GOTO 0x35C                 
     856    357          1F37                  BTFSS 0x37, 0x6            
     857    358          2B5C                  GOTO 0x35C                 
     858    359          3018                  MOVLW 0x18                 
     859    35A          00BC                  MOVWF 0x3C                 
     860    35B          2B72                  GOTO 0x372                 
     861    35C          1885                  BTFSC PORTA, 0x1           
     862    35D          2B67                  GOTO 0x367                 
     863    35E          0F38                  INCFSZ 0x38, W             
     864    35F          00B8                  MOVWF 0x38                 
     865    360          1FB8                  BTFSS 0x38, 0x7            
     866    361          2B67                  GOTO 0x367                 
     867    362          1F38                  BTFSS 0x38, 0x6            
     868    363          2B67                  GOTO 0x367                 
     869    364          3019                  MOVLW 0x19                 
     870    365          00BC                  MOVWF 0x3C                 
     871    366          2B72                  GOTO 0x372                 
     872    367          1905                  BTFSC PORTA, 0x2           
     873    368          2B74                  GOTO 0x374                 
     874    369          0F39                  INCFSZ 0x39, W             
     875    36A          00B9                  MOVWF 0x39                 
     876    36B          1FB9                  BTFSS 0x39, 0x7            
     877    36C          2B74                  GOTO 0x374                 
     878    36D          1F39                  BTFSS 0x39, 0x6            
     879    36E          2B74                  GOTO 0x374                 
     880    36F          301A                  MOVLW 0x1A                 
     881    370          00BC                  MOVWF 0x3C                 
     882    371          2B72                  GOTO 0x372                 
     883    372          21A8                  CALL 0x1A8                 
     884    373          1443                  BSF 0x43, 0x0              
     885    374          0008                  RETURN                     
     886    375          1C06                  BTFSS PORTB, 0x0           
     887    376          2B75                  GOTO 0x375                 
     888    377          1C86                  BTFSS PORTB, 0x1           
     889    378          2B75                  GOTO 0x375                 
     890    379          1D06                  BTFSS PORTB, 0x2           
     891    37A          2B75                  GOTO 0x375                 
     892    37B          1D86                  BTFSS PORTB, 0x3           
     893    37C          2B75                  GOTO 0x375                 
     894    37D          1E06                  BTFSS PORTB, 0x4           
     895    37E          2B75                  GOTO 0x375                 
     896    37F          1E86                  BTFSS PORTB, 0x5           
     897    380          2B75                  GOTO 0x375                 
     898    381          1C05                  BTFSS PORTA, 0x0           
     899    382          2B75                  GOTO 0x375                 
     900    383          1C85                  BTFSS PORTA, 0x1           
     901    384          2B75                  GOTO 0x375                 
     902    385          1D05                  BTFSS PORTA, 0x2           
     903    386          2B75                  GOTO 0x375                 
     904    387          0008                  RETURN                     
     905    388          0841                  MOVF 0x41, W               
     906    389          00BD                  MOVWF 0x3D                 
     907    38A          30FE                  MOVLW 0xFE                 
     908    38B          07C1                  ADDWF 0x41, F              
     909    38C          0AC1                  INCF 0x41, F               
     910    38D          1D03                  BTFSS STATUS, 0x2          
     911    38E          2B92                  GOTO 0x392                 
     912    38F          1507                  BSF PORTC, 0x2             
     913    390          1688                  BSF PORTD, 0x5             
     914    391          2C8C                  GOTO 0x48C                 
     915    392          083D                  MOVF 0x3D, W               
     916    393          00C1                  MOVWF 0x41                 
     917    394          30FD                  MOVLW 0xFD                 
     918    395          07C1                  ADDWF 0x41, F              
     919    396          0AC1                  INCF 0x41, F               
     920    397          1D03                  BTFSS STATUS, 0x2          
     921    398          2B9C                  GOTO 0x39C                 
     922    399          1487                  BSF PORTC, 0x1             
     923    39A          1688                  BSF PORTD, 0x5             
     924    39B          2C8C                  GOTO 0x48C                 
     925    39C          083D                  MOVF 0x3D, W               
     926    39D          00C1                  MOVWF 0x41                 
     927    39E          30FC                  MOVLW 0xFC                 
     928    39F          07C1                  ADDWF 0x41, F              
     929    3A0          0AC1                  INCF 0x41, F               
     930    3A1          1D03                  BTFSS STATUS, 0x2          
     931    3A2          2BA6                  GOTO 0x3A6                 
     932    3A3          1407                  BSF PORTC, 0x0             
     933    3A4          1688                  BSF PORTD, 0x5             
     934    3A5          2C8C                  GOTO 0x48C                 
     935    3A6          083D                  MOVF 0x3D, W               
     936    3A7          00C1                  MOVWF 0x41                 
     937    3A8          30FB                  MOVLW 0xFB                 
     938    3A9          07C1                  ADDWF 0x41, F              
     939    3AA          0AC1                  INCF 0x41, F               
     940    3AB          1D03                  BTFSS STATUS, 0x2          
     941    3AC          2BB0                  GOTO 0x3B0                 
     942    3AD          1607                  BSF PORTC, 0x4             
     943    3AE          1688                  BSF PORTD, 0x5             
     944    3AF          2C8C                  GOTO 0x48C                 
     945    3B0          083D                  MOVF 0x3D, W               
     946    3B1          00C1                  MOVWF 0x41                 
     947    3B2          30FA                  MOVLW 0xFA                 
     948    3B3          07C1                  ADDWF 0x41, F              
     949    3B4          0AC1                  INCF 0x41, F               
     950    3B5          1D03                  BTFSS STATUS, 0x2          
     951    3B6          2BBA                  GOTO 0x3BA                 
     952    3B7          1687                  BSF PORTC, 0x5             
     953    3B8          1688                  BSF PORTD, 0x5             
     954    3B9          2C8C                  GOTO 0x48C                 
     955    3BA          083D                  MOVF 0x3D, W               
     956    3BB          00C1                  MOVWF 0x41                 
     957    3BC          30F9                  MOVLW 0xF9                 
     958    3BD          07C1                  ADDWF 0x41, F              
     959    3BE          0AC1                  INCF 0x41, F               
     960    3BF          1D03                  BTFSS STATUS, 0x2          
     961    3C0          2BC4                  GOTO 0x3C4                 
     962    3C1          1707                  BSF PORTC, 0x6             
     963    3C2          1688                  BSF PORTD, 0x5             
     964    3C3          2C8C                  GOTO 0x48C                 
     965    3C4          083D                  MOVF 0x3D, W               
     966    3C5          00C1                  MOVWF 0x41                 
     967    3C6          30F8                  MOVLW 0xF8                 
     968    3C7          07C1                  ADDWF 0x41, F              
     969    3C8          0AC1                  INCF 0x41, F               
     970    3C9          1D03                  BTFSS STATUS, 0x2          
     971    3CA          2BCE                  GOTO 0x3CE                 
     972    3CB          1787                  BSF PORTC, 0x7             
     973    3CC          1688                  BSF PORTD, 0x5             
     974    3CD          2C8C                  GOTO 0x48C                 
     975    3CE          083D                  MOVF 0x3D, W               
     976    3CF          00C1                  MOVWF 0x41                 
     977    3D0          30F7                  MOVLW 0xF7                 
     978    3D1          07C1                  ADDWF 0x41, F              
     979    3D2          0AC1                  INCF 0x41, F               
     980    3D3          1D03                  BTFSS STATUS, 0x2          
     981    3D4          2BD8                  GOTO 0x3D8                 
     982    3D5          1608                  BSF PORTD, 0x4             
     983    3D6          1688                  BSF PORTD, 0x5             
     984    3D7          2C8C                  GOTO 0x48C                 
     985    3D8          083D                  MOVF 0x3D, W               
     986    3D9          00C1                  MOVWF 0x41                 
     987    3DA          30F6                  MOVLW 0xF6                 
     988    3DB          07C1                  ADDWF 0x41, F              
     989    3DC          0AC1                  INCF 0x41, F               
     990    3DD          1D03                  BTFSS STATUS, 0x2          
     991    3DE          2BE2                  GOTO 0x3E2                 
     992    3DF          1587                  BSF PORTC, 0x3             
     993    3E0          1688                  BSF PORTD, 0x5             
     994    3E1          2C8C                  GOTO 0x48C                 
     995    3E2          083D                  MOVF 0x3D, W               
     996    3E3          00C1                  MOVWF 0x41                 
     997    3E4          30F5                  MOVLW 0xF5                 
     998    3E5          07C1                  ADDWF 0x41, F              
     999    3E6          0AC1                  INCF 0x41, F               
    1000    3E7          1D03                  BTFSS STATUS, 0x2          
    1001    3E8          2BEC                  GOTO 0x3EC                 
    1002    3E9          1507                  BSF PORTC, 0x2             
    1003    3EA          1708                  BSF PORTD, 0x6             
    1004    3EB          2C8C                  GOTO 0x48C                 
    1005    3EC          083D                  MOVF 0x3D, W               
    1006    3ED          00C1                  MOVWF 0x41                 
    1007    3EE          30F4                  MOVLW 0xF4                 
    1008    3EF          07C1                  ADDWF 0x41, F              
    1009    3F0          0AC1                  INCF 0x41, F               
    1010    3F1          1D03                  BTFSS STATUS, 0x2          
    1011    3F2          2BF6                  GOTO 0x3F6                 
    1012    3F3          1487                  BSF PORTC, 0x1             
    1013    3F4          1708                  BSF PORTD, 0x6             
    1014    3F5          2C8C                  GOTO 0x48C                 
    1015    3F6          083D                  MOVF 0x3D, W               
    1016    3F7          00C1                  MOVWF 0x41                 
    1017    3F8          30F3                  MOVLW 0xF3                 
    1018    3F9          07C1                  ADDWF 0x41, F              
    1019    3FA          0AC1                  INCF 0x41, F               
    1020    3FB          1D03                  BTFSS STATUS, 0x2          
    1021    3FC          2C00                  GOTO 0x400                 
    1022    3FD          1407                  BSF PORTC, 0x0             
    1023    3FE          1708                  BSF PORTD, 0x6             
    1024    3FF          2C8C                  GOTO 0x48C                 
    1025    400          083D                  MOVF 0x3D, W               
    1026    401          00C1                  MOVWF 0x41                 
    1027    402          30F2                  MOVLW 0xF2                 
    1028    403          07C1                  ADDWF 0x41, F              
    1029    404          0AC1                  INCF 0x41, F               
    1030    405          1D03                  BTFSS STATUS, 0x2          
    1031    406          2C0A                  GOTO 0x40A                 
    1032    407          1607                  BSF PORTC, 0x4             
    1033    408          1708                  BSF PORTD, 0x6             
    1034    409          2C8C                  GOTO 0x48C                 
    1035    40A          083D                  MOVF 0x3D, W               
    1036    40B          00C1                  MOVWF 0x41                 
    1037    40C          30F1                  MOVLW 0xF1                 
    1038    40D          07C1                  ADDWF 0x41, F              
    1039    40E          0AC1                  INCF 0x41, F               
    1040    40F          1D03                  BTFSS STATUS, 0x2          
    1041    410          2C14                  GOTO 0x414                 
    1042    411          1687                  BSF PORTC, 0x5             
    1043    412          1708                  BSF PORTD, 0x6             
    1044    413          2C8C                  GOTO 0x48C                 
    1045    414          083D                  MOVF 0x3D, W               
    1046    415          00C1                  MOVWF 0x41                 
    1047    416          30F0                  MOVLW 0xF0                 
    1048    417          07C1                  ADDWF 0x41, F              
    1049    418          0AC1                  INCF 0x41, F               
    1050    419          1D03                  BTFSS STATUS, 0x2          
    1051    41A          2C1E                  GOTO 0x41E                 
    1052    41B          1707                  BSF PORTC, 0x6             
    1053    41C          1708                  BSF PORTD, 0x6             
    1054    41D          2C8C                  GOTO 0x48C                 
    1055    41E          083D                  MOVF 0x3D, W               
    1056    41F          00C1                  MOVWF 0x41                 
    1057    420          30EF                  MOVLW 0xEF                 
    1058    421          07C1                  ADDWF 0x41, F              
    1059    422          0AC1                  INCF 0x41, F               
    1060    423          1D03                  BTFSS STATUS, 0x2          
    1061    424          2C28                  GOTO 0x428                 
    1062    425          1787                  BSF PORTC, 0x7             
    1063    426          1708                  BSF PORTD, 0x6             
    1064    427          2C8C                  GOTO 0x48C                 
    1065    428          083D                  MOVF 0x3D, W               
    1066    429          00C1                  MOVWF 0x41                 
    1067    42A          30EE                  MOVLW 0xEE                 
    1068    42B          07C1                  ADDWF 0x41, F              
    1069    42C          0AC1                  INCF 0x41, F               
    1070    42D          1D03                  BTFSS STATUS, 0x2          
    1071    42E          2C32                  GOTO 0x432                 
    1072    42F          1608                  BSF PORTD, 0x4             
    1073    430          1708                  BSF PORTD, 0x6             
    1074    431          2C8C                  GOTO 0x48C                 
    1075    432          083D                  MOVF 0x3D, W               
    1076    433          00C1                  MOVWF 0x41                 
    1077    434          30ED                  MOVLW 0xED                 
    1078    435          07C1                  ADDWF 0x41, F              
    1079    436          0AC1                  INCF 0x41, F               
    1080    437          1D03                  BTFSS STATUS, 0x2          
    1081    438          2C3C                  GOTO 0x43C                 
    1082    439          1507                  BSF PORTC, 0x2             
    1083    43A          1788                  BSF PORTD, 0x7             
    1084    43B          2C8C                  GOTO 0x48C                 
    1085    43C          083D                  MOVF 0x3D, W               
    1086    43D          00C1                  MOVWF 0x41                 
    1087    43E          30EC                  MOVLW 0xEC                 
    1088    43F          07C1                  ADDWF 0x41, F              
    1089    440          0AC1                  INCF 0x41, F               
    1090    441          1D03                  BTFSS STATUS, 0x2          
    1091    442          2C46                  GOTO 0x446                 
    1092    443          1487                  BSF PORTC, 0x1             
    1093    444          1788                  BSF PORTD, 0x7             
    1094    445          2C8C                  GOTO 0x48C                 
    1095    446          083D                  MOVF 0x3D, W               
    1096    447          00C1                  MOVWF 0x41                 
    1097    448          30EB                  MOVLW 0xEB                 
    1098    449          07C1                  ADDWF 0x41, F              
    1099    44A          0AC1                  INCF 0x41, F               
    1100    44B          1D03                  BTFSS STATUS, 0x2          
    1101    44C          2C50                  GOTO 0x450                 
    1102    44D          1407                  BSF PORTC, 0x0             
    1103    44E          1788                  BSF PORTD, 0x7             
    1104    44F          2C8C                  GOTO 0x48C                 
    1105    450          083D                  MOVF 0x3D, W               
    1106    451          00C1                  MOVWF 0x41                 
    1107    452          30EA                  MOVLW 0xEA                 
    1108    453          07C1                  ADDWF 0x41, F              
    1109    454          0AC1                  INCF 0x41, F               
    1110    455          1D03                  BTFSS STATUS, 0x2          
    1111    456          2C5A                  GOTO 0x45A                 
    1112    457          1607                  BSF PORTC, 0x4             
    1113    458          1788                  BSF PORTD, 0x7             
    1114    459          2C8C                  GOTO 0x48C                 
    1115    45A          083D                  MOVF 0x3D, W               
    1116    45B          00C1                  MOVWF 0x41                 
    1117    45C          30E9                  MOVLW 0xE9                 
    1118    45D          07C1                  ADDWF 0x41, F              
    1119    45E          0AC1                  INCF 0x41, F               
    1120    45F          1D03                  BTFSS STATUS, 0x2          
    1121    460          2C64                  GOTO 0x464                 
    1122    461          1687                  BSF PORTC, 0x5             
    1123    462          1788                  BSF PORTD, 0x7             
    1124    463          2C8C                  GOTO 0x48C                 
    1125    464          083D                  MOVF 0x3D, W               
    1126    465          00C1                  MOVWF 0x41                 
    1127    466          30E8                  MOVLW 0xE8                 
    1128    467          07C1                  ADDWF 0x41, F              
    1129    468          0AC1                  INCF 0x41, F               
    1130    469          1D03                  BTFSS STATUS, 0x2          
    1131    46A          2C6E                  GOTO 0x46E                 
    1132    46B          1707                  BSF PORTC, 0x6             
    1133    46C          1788                  BSF PORTD, 0x7             
    1134    46D          2C8C                  GOTO 0x48C                 
    1135    46E          083D                  MOVF 0x3D, W               
    1136    46F          00C1                  MOVWF 0x41                 
    1137    470          30E7                  MOVLW 0xE7                 
    1138    471          07C1                  ADDWF 0x41, F              
    1139    472          0AC1                  INCF 0x41, F               
    1140    473          1D03                  BTFSS STATUS, 0x2          
    1141    474          2C78                  GOTO 0x478                 
    1142    475          1787                  BSF PORTC, 0x7             
    1143    476          1788                  BSF PORTD, 0x7             
    1144    477          2C8C                  GOTO 0x48C                 
    1145    478          083D                  MOVF 0x3D, W               
    1146    479          00C1                  MOVWF 0x41                 
    1147    47A          30E6                  MOVLW 0xE6                 
    1148    47B          07C1                  ADDWF 0x41, F              
    1149    47C          0AC1                  INCF 0x41, F               
    1150    47D          1D03                  BTFSS STATUS, 0x2          
    1151    47E          2C82                  GOTO 0x482                 
    1152    47F          1608                  BSF PORTD, 0x4             
    1153    480          1788                  BSF PORTD, 0x7             
    1154    481          2C8C                  GOTO 0x48C                 
    1155    482          083D                  MOVF 0x3D, W               
    1156    483          00C1                  MOVWF 0x41                 
    1157    484          30E5                  MOVLW 0xE5                 
    1158    485          07C1                  ADDWF 0x41, F              
    1159    486          0AC1                  INCF 0x41, F               
    1160    487          1D03                  BTFSS STATUS, 0x2          
    1161    488          2C8B                  GOTO 0x48B                 
    1162    489          1587                  BSF PORTC, 0x3             
    1163    48A          1788                  BSF PORTD, 0x7             
    1164    48B          0000                  NOP                        
    1165    48C          0008                  RETURN                     
    1166    48D          1143                  BCF 0x43, 0x2              
    1167    48E          1A05                  BTFSC PORTA, 0x4           
    1168    48F          2C95                  GOTO 0x495                 
    1169    490          0F44                  INCFSZ 0x44, W             
    1170    491          00C4                  MOVWF 0x44                 
    1171    492          1FC4                  BTFSS 0x44, 0x7            
    1172    493          2C95                  GOTO 0x495                 
    1173    494          1543                  BSF 0x43, 0x2              
    1174    495          0008                  RETURN                     
    1175    496          1407                  BSF PORTC, 0x0             
    1176    497          1688                  BSF PORTD, 0x5             
    1177    498          2219                  CALL 0x219                 
    1178    499          1007                  BCF PORTC, 0x0             
    1179    49A          1288                  BCF PORTD, 0x5             
    1180    49B          2219                  CALL 0x219                 
    1181    49C          0008                  RETURN                     
    1182    49D          1407                  BSF PORTC, 0x0             
    1183    49E          1688                  BSF PORTD, 0x5             
    1184    49F          220C                  CALL 0x20C                 
    1185    4A0          1007                  BCF PORTC, 0x0             
    1186    4A1          1288                  BCF PORTD, 0x5             
    1187    4A2          220C                  CALL 0x20C                 
    1188    4A3          0008                  RETURN                     
    1189    4A4          1407                  BSF PORTC, 0x0             
    1190    4A5          1708                  BSF PORTD, 0x6             
    1191    4A6          220C                  CALL 0x20C                 
    1192    4A7          1007                  BCF PORTC, 0x0             
    1193    4A8          1308                  BCF PORTD, 0x6             
    1194    4A9          220C                  CALL 0x20C                 
    1195    4AA          0008                  RETURN                     
    1196    4AB          0845                  MOVF 0x45, W               
    1197    4AC          00C6                  MOVWF 0x46                 
    1198    4AD          0008                  RETURN                     
    1199    4AE          0846                  MOVF 0x46, W               
    1200    4AF          00C5                  MOVWF 0x45                 
    1201    4B0          0008                  RETURN                     
    1202    4B1          1507                  BSF PORTC, 0x2             
    1203    4B2          1688                  BSF PORTD, 0x5             
    1204    4B3          2226                  CALL 0x226                 
    1205    4B4          21FC                  CALL 0x1FC                 
    1206    4B5          1487                  BSF PORTC, 0x1             
    1207    4B6          1688                  BSF PORTD, 0x5             
    1208    4B7          2226                  CALL 0x226                 
    1209    4B8          21FC                  CALL 0x1FC                 
    1210    4B9          1407                  BSF PORTC, 0x0             
    1211    4BA          1688                  BSF PORTD, 0x5             
    1212    4BB          2226                  CALL 0x226                 
    1213    4BC          21FC                  CALL 0x1FC                 
    1214    4BD          1607                  BSF PORTC, 0x4             
    1215    4BE          1688                  BSF PORTD, 0x5             
    1216    4BF          2226                  CALL 0x226                 
    1217    4C0          21FC                  CALL 0x1FC                 
    1218    4C1          1687                  BSF PORTC, 0x5             
    1219    4C2          1688                  BSF PORTD, 0x5             
    1220    4C3          2226                  CALL 0x226                 
    1221    4C4          21FC                  CALL 0x1FC                 
    1222    4C5          1707                  BSF PORTC, 0x6             
    1223    4C6          1688                  BSF PORTD, 0x5             
    1224    4C7          2226                  CALL 0x226                 
    1225    4C8          21FC                  CALL 0x1FC                 
    1226    4C9          1787                  BSF PORTC, 0x7             
    1227    4CA          1688                  BSF PORTD, 0x5             
    1228    4CB          2226                  CALL 0x226                 
    1229    4CC          21FC                  CALL 0x1FC                 
    1230    4CD          1608                  BSF PORTD, 0x4             
    1231    4CE          1688                  BSF PORTD, 0x5             
    1232    4CF          2226                  CALL 0x226                 
    1233    4D0          21FC                  CALL 0x1FC                 
    1234    4D1          1587                  BSF PORTC, 0x3             
    1235    4D2          1688                  BSF PORTD, 0x5             
    1236    4D3          2226                  CALL 0x226                 
    1237    4D4          21FC                  CALL 0x1FC                 
    1238    4D5          1507                  BSF PORTC, 0x2             
    1239    4D6          1708                  BSF PORTD, 0x6             
    1240    4D7          2226                  CALL 0x226                 
    1241    4D8          21FC                  CALL 0x1FC                 
    1242    4D9          1487                  BSF PORTC, 0x1             
    1243    4DA          1708                  BSF PORTD, 0x6             
    1244    4DB          2226                  CALL 0x226                 
    1245    4DC          21FC                  CALL 0x1FC                 
    1246    4DD          1407                  BSF PORTC, 0x0             
    1247    4DE          1708                  BSF PORTD, 0x6             
    1248    4DF          2226                  CALL 0x226                 
    1249    4E0          21FC                  CALL 0x1FC                 
    1250    4E1          1607                  BSF PORTC, 0x4             
    1251    4E2          1708                  BSF PORTD, 0x6             
    1252    4E3          2226                  CALL 0x226                 
    1253    4E4          21FC                  CALL 0x1FC                 
    1254    4E5          1687                  BSF PORTC, 0x5             
    1255    4E6          1708                  BSF PORTD, 0x6             
    1256    4E7          2226                  CALL 0x226                 
    1257    4E8          21FC                  CALL 0x1FC                 
    1258    4E9          1707                  BSF PORTC, 0x6             
    1259    4EA          1708                  BSF PORTD, 0x6             
    1260    4EB          2226                  CALL 0x226                 
    1261    4EC          21FC                  CALL 0x1FC                 
    1262    4ED          1787                  BSF PORTC, 0x7             
    1263    4EE          1708                  BSF PORTD, 0x6             
    1264    4EF          2226                  CALL 0x226                 
    1265    4F0          21FC                  CALL 0x1FC                 
    1266    4F1          1608                  BSF PORTD, 0x4             
    1267    4F2          1708                  BSF PORTD, 0x6             
    1268    4F3          2226                  CALL 0x226                 
    1269    4F4          21FC                  CALL 0x1FC                 
    1270    4F5          1507                  BSF PORTC, 0x2             
    1271    4F6          1788                  BSF PORTD, 0x7             
    1272    4F7          2226                  CALL 0x226                 
    1273    4F8          21FC                  CALL 0x1FC                 
    1274    4F9          1487                  BSF PORTC, 0x1             
    1275    4FA          1788                  BSF PORTD, 0x7             
    1276    4FB          2226                  CALL 0x226                 
    1277    4FC          21FC                  CALL 0x1FC                 
    1278    4FD          1407                  BSF PORTC, 0x0             
    1279    4FE          1788                  BSF PORTD, 0x7             
    1280    4FF          2226                  CALL 0x226                 
    1281    500          21FC                  CALL 0x1FC                 
    1282    501          1607                  BSF PORTC, 0x4             
    1283    502          1788                  BSF PORTD, 0x7             
    1284    503          2226                  CALL 0x226                 
    1285    504          21FC                  CALL 0x1FC                 
    1286    505          1687                  BSF PORTC, 0x5             
    1287    506          1788                  BSF PORTD, 0x7             
    1288    507          2226                  CALL 0x226                 
    1289    508          21FC                  CALL 0x1FC                 
    1290    509          1707                  BSF PORTC, 0x6             
    1291    50A          1788                  BSF PORTD, 0x7             
    1292    50B          2226                  CALL 0x226                 
    1293    50C          21FC                  CALL 0x1FC                 
    1294    50D          1787                  BSF PORTC, 0x7             
    1295    50E          1788                  BSF PORTD, 0x7             
    1296    50F          2226                  CALL 0x226                 
    1297    510          21FC                  CALL 0x1FC                 
    1298    511          1608                  BSF PORTD, 0x4             
    1299    512          1788                  BSF PORTD, 0x7             
    1300    513          2226                  CALL 0x226                 
    1301    514          21FC                  CALL 0x1FC                 
    1302    515          1587                  BSF PORTC, 0x3             
    1303    516          1788                  BSF PORTD, 0x7             
    1304    517          2226                  CALL 0x226                 
    1305    518          21FC                  CALL 0x1FC                 
    1306    519          0008                  RETURN                     
    1307    51A          3400                  RETLW 0x0                  
    1308    51B          3400                  RETLW 0x0                  
    1309    51C          3FFF                  ADDLW 0xFF                 
    1310    51D          3FFF                  ADDLW 0xFF                 
    1311    51E          3FFF                  ADDLW 0xFF                 
    1312    51F          3FFF                  ADDLW 0xFF                 
    1313    520          3FFF                  ADDLW 0xFF                 
    1314    521          3FFF                  ADDLW 0xFF                 
    1315    522          3FFF                  ADDLW 0xFF                 
    1316    523          3FFF                  ADDLW 0xFF                 
    1317    524          3FFF                  ADDLW 0xFF                 
    1318    525          3FFF                  ADDLW 0xFF                 
    1319    526          3FFF                  ADDLW 0xFF                 
    1320    527          3FFF                  ADDLW 0xFF                 
    1321    528          3FFF                  ADDLW 0xFF                 
    1322    529          3FFF                  ADDLW 0xFF                 
    1323    52A          3FFF                  ADDLW 0xFF                 
    1324    52B          3FFF                  ADDLW 0xFF                 
    1325    52C          3FFF                  ADDLW 0xFF                 
    1326    52D          3FFF                  ADDLW 0xFF                 
    1327    52E          3FFF                  ADDLW 0xFF                 
    1328    52F          3FFF                  ADDLW 0xFF                 
    1329    530          3FFF                  ADDLW 0xFF                 
    1330    531          3FFF                  ADDLW 0xFF                 
    1331    532          3FFF                  ADDLW 0xFF                 
    1332    533          3FFF                  ADDLW 0xFF                 
    1333    534          3FFF                  ADDLW 0xFF                 
    1334    535          3FFF                  ADDLW 0xFF                 
    1335    536          3FFF                  ADDLW 0xFF                 
    1336    537          3FFF                  ADDLW 0xFF                 
    1337    538          3FFF                  ADDLW 0xFF                 
    1338    539          3FFF                  ADDLW 0xFF                 
    1339    53A          3FFF                  ADDLW 0xFF                 
    1340    53B          3FFF                  ADDLW 0xFF                 
    1341    53C          3FFF                  ADDLW 0xFF                 
    1342    53D          3FFF                  ADDLW 0xFF                 
    1343    53E          3FFF                  ADDLW 0xFF                 
    1344    53F          3FFF                  ADDLW 0xFF                 
    1345    540          3FFF                  ADDLW 0xFF                 
    1346    541          3FFF                  ADDLW 0xFF                 
    1347    542          3FFF                  ADDLW 0xFF                 
    1348    543          3FFF                  ADDLW 0xFF                 
    1349    544          3FFF                  ADDLW 0xFF                 
    1350    545          3FFF                  ADDLW 0xFF                 
    1351    546          3FFF                  ADDLW 0xFF                 
    1352    547          3FFF                  ADDLW 0xFF                 
    1353    548          3FFF                  ADDLW 0xFF                 
    1354    549          3FFF                  ADDLW 0xFF                 
    1355    54A          3FFF                  ADDLW 0xFF                 
    1356    54B          3FFF                  ADDLW 0xFF                 
    1357    54C          3FFF                  ADDLW 0xFF                 
    1358    54D          3FFF                  ADDLW 0xFF                 
    1359    54E          3FFF                  ADDLW 0xFF                 
    1360    54F          3FFF                  ADDLW 0xFF                 
    1361    550          3FFF                  ADDLW 0xFF                 
    1362    551          3FFF                  ADDLW 0xFF                 
    1363    552          3FFF                  ADDLW 0xFF                 
    1364    553          3FFF                  ADDLW 0xFF                 
    1365    554          3FFF                  ADDLW 0xFF                 
    1366    555          3FFF                  ADDLW 0xFF                 
    1367    556          3FFF                  ADDLW 0xFF                 
    1368    557          3FFF                  ADDLW 0xFF                 
    1369    558          3FFF                  ADDLW 0xFF                 
    1370    559          3FFF                  ADDLW 0xFF                 
    1371    55A          3FFF                  ADDLW 0xFF                 
    1372    55B          3FFF                  ADDLW 0xFF                 
    1373    55C          3FFF                  ADDLW 0xFF                 
    1374    55D          3FFF                  ADDLW 0xFF                 
    1375    55E          3FFF                  ADDLW 0xFF                 
    1376    55F          3FFF                  ADDLW 0xFF                 
    1377    560          3FFF                  ADDLW 0xFF                 
    1378    561          3FFF                  ADDLW 0xFF                 
    1379    562          3FFF                  ADDLW 0xFF                 
    1380    563          3FFF                  ADDLW 0xFF                 
    1381    564          3FFF                  ADDLW 0xFF                 
    1382    565          3FFF                  ADDLW 0xFF                 
    1383    566          3FFF                  ADDLW 0xFF                 
    1384    567          3FFF                  ADDLW 0xFF                 
    1385    568          3FFF                  ADDLW 0xFF                 
    1386    569          3FFF                  ADDLW 0xFF                 
    1387    56A          3FFF                  ADDLW 0xFF                 
    1388    56B          3FFF                  ADDLW 0xFF                 
    1389    56C          3FFF                  ADDLW 0xFF                 
    1390    56D          3FFF                  ADDLW 0xFF                 
    1391    56E          3FFF                  ADDLW 0xFF                 
    1392    56F          3FFF                  ADDLW 0xFF                 
    1393    570          3FFF                  ADDLW 0xFF                 
    1394    571          3FFF                  ADDLW 0xFF                 
    1395    572          3FFF                  ADDLW 0xFF                 
    1396    573          3FFF                  ADDLW 0xFF                 
    1397    574          3FFF                  ADDLW 0xFF                 
    1398    575          3FFF                  ADDLW 0xFF                 
    1399    576          3FFF                  ADDLW 0xFF                 
    1400    577          3FFF                  ADDLW 0xFF                 
    1401    578          3FFF                  ADDLW 0xFF                 
    1402    579          3FFF                  ADDLW 0xFF                 
    1403    57A          3FFF                  ADDLW 0xFF                 
    1404    57B          3FFF                  ADDLW 0xFF                 
    1405    57C          3FFF                  ADDLW 0xFF                 
    1406    57D          3FFF                  ADDLW 0xFF                 
    1407    57E          3FFF                  ADDLW 0xFF                 
    1408    57F          3FFF                  ADDLW 0xFF                 
    1409    580          3FFF                  ADDLW 0xFF                 
    1410    581          3FFF                  ADDLW 0xFF                 
    1411    582          3FFF                  ADDLW 0xFF                 
    1412    583          3FFF                  ADDLW 0xFF                 
    1413    584          3FFF                  ADDLW 0xFF                 
    1414    585          3FFF                  ADDLW 0xFF                 
    1415    586          3FFF                  ADDLW 0xFF                 
    1416    587          3FFF                  ADDLW 0xFF                 
    1417    588          3FFF                  ADDLW 0xFF                 
    1418    589          3FFF                  ADDLW 0xFF                 
    1419    58A          3FFF                  ADDLW 0xFF                 
    1420    58B          3FFF                  ADDLW 0xFF                 
    1421    58C          3FFF                  ADDLW 0xFF                 
    1422    58D          3FFF                  ADDLW 0xFF                 
    1423    58E          3FFF                  ADDLW 0xFF                 
    1424    58F          3FFF                  ADDLW 0xFF                 
    1425    590          3FFF                  ADDLW 0xFF                 
    1426    591          3FFF                  ADDLW 0xFF                 
    1427    592          3FFF                  ADDLW 0xFF                 
    1428    593          3FFF                  ADDLW 0xFF                 
    1429    594          3FFF                  ADDLW 0xFF                 
    1430    595          3FFF                  ADDLW 0xFF                 
    1431    596          3FFF                  ADDLW 0xFF                 
    1432    597          3FFF                  ADDLW 0xFF                 
    1433    598          3FFF                  ADDLW 0xFF                 
    1434    599          3FFF                  ADDLW 0xFF                 
    1435    59A          3FFF                  ADDLW 0xFF                 
    1436    59B          3FFF                  ADDLW 0xFF                 
    1437    59C          3FFF                  ADDLW 0xFF                 
    1438    59D          3FFF                  ADDLW 0xFF                 
    1439    59E          3FFF                  ADDLW 0xFF                 
    1440    59F          3FFF                  ADDLW 0xFF                 
    1441    5A0          3FFF                  ADDLW 0xFF                 
    1442    5A1          3FFF                  ADDLW 0xFF                 
    1443    5A2          3FFF                  ADDLW 0xFF                 
    1444    5A3          3FFF                  ADDLW 0xFF                 
    1445    5A4          3FFF                  ADDLW 0xFF                 
    1446    5A5          3FFF                  ADDLW 0xFF                 
    1447    5A6          3FFF                  ADDLW 0xFF                 
    1448    5A7          3FFF                  ADDLW 0xFF                 
    1449    5A8          3FFF                  ADDLW 0xFF                 
    1450    5A9          3FFF                  ADDLW 0xFF                 
    1451    5AA          3FFF                  ADDLW 0xFF                 
    1452    5AB          3FFF                  ADDLW 0xFF                 
    1453    5AC          3FFF                  ADDLW 0xFF                 
    1454    5AD          3FFF                  ADDLW 0xFF                 
    1455    5AE          3FFF                  ADDLW 0xFF                 
    1456    5AF          3FFF                  ADDLW 0xFF                 
    1457    5B0          3FFF                  ADDLW 0xFF                 
    1458    5B1          3FFF                  ADDLW 0xFF                 
    1459    5B2          3FFF                  ADDLW 0xFF                 
    1460    5B3          3FFF                  ADDLW 0xFF                 
    1461    5B4          3FFF                  ADDLW 0xFF                 
    1462    5B5          3FFF                  ADDLW 0xFF                 
    1463    5B6          3FFF                  ADDLW 0xFF                 
    1464    5B7          3FFF                  ADDLW 0xFF                 
    1465    5B8          3FFF                  ADDLW 0xFF                 
    1466    5B9          3FFF                  ADDLW 0xFF                 
    1467    5BA          3FFF                  ADDLW 0xFF                 
    1468    5BB          3FFF                  ADDLW 0xFF                 
    1469    5BC          3FFF                  ADDLW 0xFF                 
    1470    5BD          3FFF                  ADDLW 0xFF                 
    1471    5BE          3FFF                  ADDLW 0xFF                 
    1472    5BF          3FFF                  ADDLW 0xFF                 
    1473    5C0          3FFF                  ADDLW 0xFF                 
    1474    5C1          3FFF                  ADDLW 0xFF                 
    1475    5C2          3FFF                  ADDLW 0xFF                 
    1476    5C3          3FFF                  ADDLW 0xFF                 
    1477    5C4          3FFF                  ADDLW 0xFF                 
    1478    5C5          3FFF                  ADDLW 0xFF                 
    1479    5C6          3FFF                  ADDLW 0xFF                 
    1480    5C7          3FFF                  ADDLW 0xFF                 
    1481    5C8          3FFF                  ADDLW 0xFF                 
    1482    5C9          3FFF                  ADDLW 0xFF                 
    1483    5CA          3FFF                  ADDLW 0xFF                 
    1484    5CB          3FFF                  ADDLW 0xFF                 
    1485    5CC          3FFF                  ADDLW 0xFF                 
    1486    5CD          3FFF                  ADDLW 0xFF                 
    1487    5CE          3FFF                  ADDLW 0xFF                 
    1488    5CF          3FFF                  ADDLW 0xFF                 
    1489    5D0          3FFF                  ADDLW 0xFF                 
    1490    5D1          3FFF                  ADDLW 0xFF                 
    1491    5D2          3FFF                  ADDLW 0xFF                 
    1492    5D3          3FFF                  ADDLW 0xFF                 
    1493    5D4          3FFF                  ADDLW 0xFF                 
    1494    5D5          3FFF                  ADDLW 0xFF                 
    1495    5D6          3FFF                  ADDLW 0xFF                 
    1496    5D7          3FFF                  ADDLW 0xFF                 
    1497    5D8          3FFF                  ADDLW 0xFF                 
    1498    5D9          3FFF                  ADDLW 0xFF                 
    1499    5DA          3FFF                  ADDLW 0xFF                 
    1500    5DB          3FFF                  ADDLW 0xFF                 
    1501    5DC          3FFF                  ADDLW 0xFF                 
    1502    5DD          3FFF                  ADDLW 0xFF                 
    1503    5DE          3FFF                  ADDLW 0xFF                 
    1504    5DF          3FFF                  ADDLW 0xFF                 
    1505    5E0          3FFF                  ADDLW 0xFF                 
    1506    5E1          3FFF                  ADDLW 0xFF                 
    1507    5E2          3FFF                  ADDLW 0xFF                 
    1508    5E3          3FFF                  ADDLW 0xFF                 
    1509    5E4          3FFF                  ADDLW 0xFF                 
    1510    5E5          3FFF                  ADDLW 0xFF                 
    1511    5E6          3FFF                  ADDLW 0xFF                 
    1512    5E7          3FFF                  ADDLW 0xFF                 
    1513    5E8          3FFF                  ADDLW 0xFF                 
    1514    5E9          3FFF                  ADDLW 0xFF                 
    1515    5EA          3FFF                  ADDLW 0xFF                 
    1516    5EB          3FFF                  ADDLW 0xFF                 
    1517    5EC          3FFF                  ADDLW 0xFF                 
    1518    5ED          3FFF                  ADDLW 0xFF                 
    1519    5EE          3FFF                  ADDLW 0xFF                 
    1520    5EF          3FFF                  ADDLW 0xFF                 
    1521    5F0          3FFF                  ADDLW 0xFF                 
    1522    5F1          3FFF                  ADDLW 0xFF                 
    1523    5F2          3FFF                  ADDLW 0xFF                 
    1524    5F3          3FFF                  ADDLW 0xFF                 
    1525    5F4          3FFF                  ADDLW 0xFF                 
    1526    5F5          3FFF                  ADDLW 0xFF                 
    1527    5F6          3FFF                  ADDLW 0xFF                 
    1528    5F7          3FFF                  ADDLW 0xFF                 
    1529    5F8          3FFF                  ADDLW 0xFF                 
    1530    5F9          3FFF                  ADDLW 0xFF                 
    1531    5FA          3FFF                  ADDLW 0xFF                 
    1532    5FB          3FFF                  ADDLW 0xFF                 
    1533    5FC          3FFF                  ADDLW 0xFF                 
    1534    5FD          3FFF                  ADDLW 0xFF                 
    1535    5FE          3FFF                  ADDLW 0xFF                 
    1536    5FF          3FFF                  ADDLW 0xFF                 
    1537    600          3FFF                  ADDLW 0xFF                 
    1538    601          3FFF                  ADDLW 0xFF                 
    1539    602          3FFF                  ADDLW 0xFF                 
    1540    603          3FFF                  ADDLW 0xFF                 
    1541    604          3FFF                  ADDLW 0xFF                 
    1542    605          3FFF                  ADDLW 0xFF                 
    1543    606          3FFF                  ADDLW 0xFF                 
    1544    607          3FFF                  ADDLW 0xFF                 
    1545    608          3FFF                  ADDLW 0xFF                 
    1546    609          3FFF                  ADDLW 0xFF                 
    1547    60A          3FFF                  ADDLW 0xFF                 
    1548    60B          3FFF                  ADDLW 0xFF                 
    1549    60C          3FFF                  ADDLW 0xFF                 
    1550    60D          3FFF                  ADDLW 0xFF                 
    1551    60E          3FFF                  ADDLW 0xFF                 
    1552    60F          3FFF                  ADDLW 0xFF                 
    1553    610          3FFF                  ADDLW 0xFF                 
    1554    611          3FFF                  ADDLW 0xFF                 
    1555    612          3FFF                  ADDLW 0xFF                 
    1556    613          3FFF                  ADDLW 0xFF                 
    1557    614          3FFF                  ADDLW 0xFF                 
    1558    615          3FFF                  ADDLW 0xFF                 
    1559    616          3FFF                  ADDLW 0xFF                 
    1560    617          3FFF                  ADDLW 0xFF                 
    1561    618          3FFF                  ADDLW 0xFF                 
    1562    619          3FFF                  ADDLW 0xFF                 
    1563    61A          3FFF                  ADDLW 0xFF                 
    1564    61B          3FFF                  ADDLW 0xFF                 
    1565    61C          3FFF                  ADDLW 0xFF                 
    1566    61D          3FFF                  ADDLW 0xFF                 
    1567    61E          3FFF                  ADDLW 0xFF                 
    1568    61F          3FFF                  ADDLW 0xFF                 
    1569    620          3FFF                  ADDLW 0xFF                 
    1570    621          3FFF                  ADDLW 0xFF                 
    1571    622          3FFF                  ADDLW 0xFF                 
    1572    623          3FFF                  ADDLW 0xFF                 
    1573    624          3FFF                  ADDLW 0xFF                 
    1574    625          3FFF                  ADDLW 0xFF                 
    1575    626          3FFF                  ADDLW 0xFF                 
    1576    627          3FFF                  ADDLW 0xFF                 
    1577    628          3FFF                  ADDLW 0xFF                 
    1578    629          3FFF                  ADDLW 0xFF                 
    1579    62A          3FFF                  ADDLW 0xFF                 
    1580    62B          3FFF                  ADDLW 0xFF                 
    1581    62C          3FFF                  ADDLW 0xFF                 
    1582    62D          3FFF                  ADDLW 0xFF                 
    1583    62E          3FFF                  ADDLW 0xFF                 
    1584    62F          3FFF                  ADDLW 0xFF                 
    1585    630          3FFF                  ADDLW 0xFF                 
    1586    631          3FFF                  ADDLW 0xFF                 
    1587    632          3FFF                  ADDLW 0xFF                 
    1588    633          3FFF                  ADDLW 0xFF                 
    1589    634          3FFF                  ADDLW 0xFF                 
    1590    635          3FFF                  ADDLW 0xFF                 
    1591    636          3FFF                  ADDLW 0xFF                 
    1592    637          3FFF                  ADDLW 0xFF                 
    1593    638          3FFF                  ADDLW 0xFF                 
    1594    639          3FFF                  ADDLW 0xFF                 
    1595    63A          3FFF                  ADDLW 0xFF                 
    1596    63B          3FFF                  ADDLW 0xFF                 
    1597    63C          3FFF                  ADDLW 0xFF                 
    1598    63D          3FFF                  ADDLW 0xFF                 
    1599    63E          3FFF                  ADDLW 0xFF                 
    1600    63F          3FFF                  ADDLW 0xFF                 
    1601    640          3FFF                  ADDLW 0xFF                 
    1602    641          3FFF                  ADDLW 0xFF                 
    1603    642          3FFF                  ADDLW 0xFF                 
    1604    643          3FFF                  ADDLW 0xFF                 
    1605    644          3FFF                  ADDLW 0xFF                 
    1606    645          3FFF                  ADDLW 0xFF                 
    1607    646          3FFF                  ADDLW 0xFF                 
    1608    647          3FFF                  ADDLW 0xFF                 
    1609    648          3FFF                  ADDLW 0xFF                 
    1610    649          3FFF                  ADDLW 0xFF                 
    1611    64A          3FFF                  ADDLW 0xFF                 
    1612    64B          3FFF                  ADDLW 0xFF                 
    1613    64C          3FFF                  ADDLW 0xFF                 
    1614    64D          3FFF                  ADDLW 0xFF                 
    1615    64E          3FFF                  ADDLW 0xFF                 
    1616    64F          3FFF                  ADDLW 0xFF                 
    1617    650          3FFF                  ADDLW 0xFF                 
    1618    651          3FFF                  ADDLW 0xFF                 
    1619    652          3FFF                  ADDLW 0xFF                 
    1620    653          3FFF                  ADDLW 0xFF                 
    1621    654          3FFF                  ADDLW 0xFF                 
    1622    655          3FFF                  ADDLW 0xFF                 
    1623    656          3FFF                  ADDLW 0xFF                 
    1624    657          3FFF                  ADDLW 0xFF                 
    1625    658          3FFF                  ADDLW 0xFF                 
    1626    659          3FFF                  ADDLW 0xFF                 
    1627    65A          3FFF                  ADDLW 0xFF                 
    1628    65B          3FFF                  ADDLW 0xFF                 
    1629    65C          3FFF                  ADDLW 0xFF                 
    1630    65D          3FFF                  ADDLW 0xFF                 
    1631    65E          3FFF                  ADDLW 0xFF                 
    1632    65F          3FFF                  ADDLW 0xFF                 
    1633    660          3FFF                  ADDLW 0xFF                 
    1634    661          3FFF                  ADDLW 0xFF                 
    1635    662          3FFF                  ADDLW 0xFF                 
    1636    663          3FFF                  ADDLW 0xFF                 
    1637    664          3FFF                  ADDLW 0xFF                 
    1638    665          3FFF                  ADDLW 0xFF                 
    1639    666          3FFF                  ADDLW 0xFF                 
    1640    667          3FFF                  ADDLW 0xFF                 
    1641    668          3FFF                  ADDLW 0xFF                 
    1642    669          3FFF                  ADDLW 0xFF                 
    1643    66A          3FFF                  ADDLW 0xFF                 
    1644    66B          3FFF                  ADDLW 0xFF                 
    1645    66C          3FFF                  ADDLW 0xFF                 
    1646    66D          3FFF                  ADDLW 0xFF                 
    1647    66E          3FFF                  ADDLW 0xFF                 
    1648    66F          3FFF                  ADDLW 0xFF                 
    1649    670          3FFF                  ADDLW 0xFF                 
    1650    671          3FFF                  ADDLW 0xFF                 
    1651    672          3FFF                  ADDLW 0xFF                 
    1652    673          3FFF                  ADDLW 0xFF                 
    1653    674          3FFF                  ADDLW 0xFF                 
    1654    675          3FFF                  ADDLW 0xFF                 
    1655    676          3FFF                  ADDLW 0xFF                 
    1656    677          3FFF                  ADDLW 0xFF                 
    1657    678          3FFF                  ADDLW 0xFF                 
    1658    679          3FFF                  ADDLW 0xFF                 
    1659    67A          3FFF                  ADDLW 0xFF                 
    1660    67B          3FFF                  ADDLW 0xFF                 
    1661    67C          3FFF                  ADDLW 0xFF                 
    1662    67D          3FFF                  ADDLW 0xFF                 
    1663    67E          3FFF                  ADDLW 0xFF                 
    1664    67F          3FFF                  ADDLW 0xFF                 
    1665    680          3FFF                  ADDLW 0xFF                 
    1666    681          3FFF                  ADDLW 0xFF                 
    1667    682          3FFF                  ADDLW 0xFF                 
    1668    683          3FFF                  ADDLW 0xFF                 
    1669    684          3FFF                  ADDLW 0xFF                 
    1670    685          3FFF                  ADDLW 0xFF                 
    1671    686          3FFF                  ADDLW 0xFF                 
    1672    687          3FFF                  ADDLW 0xFF                 
    1673    688          3FFF                  ADDLW 0xFF                 
    1674    689          3FFF                  ADDLW 0xFF                 
    1675    68A          3FFF                  ADDLW 0xFF                 
    1676    68B          3FFF                  ADDLW 0xFF                 
    1677    68C          3FFF                  ADDLW 0xFF                 
    1678    68D          3FFF                  ADDLW 0xFF                 
    1679    68E          3FFF                  ADDLW 0xFF                 
    1680    68F          3FFF                  ADDLW 0xFF                 
    1681    690          3FFF                  ADDLW 0xFF                 
    1682    691          3FFF                  ADDLW 0xFF                 
    1683    692          3FFF                  ADDLW 0xFF                 
    1684    693          3FFF                  ADDLW 0xFF                 
    1685    694          3FFF                  ADDLW 0xFF                 
    1686    695          3FFF                  ADDLW 0xFF                 
    1687    696          3FFF                  ADDLW 0xFF                 
    1688    697          3FFF                  ADDLW 0xFF                 
    1689    698          3FFF                  ADDLW 0xFF                 
    1690    699          3FFF                  ADDLW 0xFF                 
    1691    69A          3FFF                  ADDLW 0xFF                 
    1692    69B          3FFF                  ADDLW 0xFF                 
    1693    69C          3FFF                  ADDLW 0xFF                 
    1694    69D          3FFF                  ADDLW 0xFF                 
    1695    69E          3FFF                  ADDLW 0xFF                 
    1696    69F          3FFF                  ADDLW 0xFF                 
    1697    6A0          3FFF                  ADDLW 0xFF                 
    1698    6A1          3FFF                  ADDLW 0xFF                 
    1699    6A2          3FFF                  ADDLW 0xFF                 
    1700    6A3          3FFF                  ADDLW 0xFF                 
    1701    6A4          3FFF                  ADDLW 0xFF                 
    1702    6A5          3FFF                  ADDLW 0xFF                 
    1703    6A6          3FFF                  ADDLW 0xFF                 
    1704    6A7          3FFF                  ADDLW 0xFF                 
    1705    6A8          3FFF                  ADDLW 0xFF                 
    1706    6A9          3FFF                  ADDLW 0xFF                 
    1707    6AA          3FFF                  ADDLW 0xFF                 
    1708    6AB          3FFF                  ADDLW 0xFF                 
    1709    6AC          3FFF                  ADDLW 0xFF                 
    1710    6AD          3FFF                  ADDLW 0xFF                 
    1711    6AE          3FFF                  ADDLW 0xFF                 
    1712    6AF          3FFF                  ADDLW 0xFF                 
    1713    6B0          3FFF                  ADDLW 0xFF                 
    1714    6B1          3FFF                  ADDLW 0xFF                 
    1715    6B2          3FFF                  ADDLW 0xFF                 
    1716    6B3          3FFF                  ADDLW 0xFF                 
    1717    6B4          3FFF                  ADDLW 0xFF                 
    1718    6B5          3FFF                  ADDLW 0xFF                 
    1719    6B6          3FFF                  ADDLW 0xFF                 
    1720    6B7          3FFF                  ADDLW 0xFF                 
    1721    6B8          3FFF                  ADDLW 0xFF                 
    1722    6B9          3FFF                  ADDLW 0xFF                 
    1723    6BA          3FFF                  ADDLW 0xFF                 
    1724    6BB          3FFF                  ADDLW 0xFF                 
    1725    6BC          3FFF                  ADDLW 0xFF                 
    1726    6BD          3FFF                  ADDLW 0xFF                 
    1727    6BE          3FFF                  ADDLW 0xFF                 
    1728    6BF          3FFF                  ADDLW 0xFF                 
    1729    6C0          3FFF                  ADDLW 0xFF                 
    1730    6C1          3FFF                  ADDLW 0xFF                 
    1731    6C2          3FFF                  ADDLW 0xFF                 
    1732    6C3          3FFF                  ADDLW 0xFF                 
    1733    6C4          3FFF                  ADDLW 0xFF                 
    1734    6C5          3FFF                  ADDLW 0xFF                 
    1735    6C6          3FFF                  ADDLW 0xFF                 
    1736    6C7          3FFF                  ADDLW 0xFF                 
    1737    6C8          3FFF                  ADDLW 0xFF                 
    1738    6C9          3FFF                  ADDLW 0xFF                 
    1739    6CA          3FFF                  ADDLW 0xFF                 
    1740    6CB          3FFF                  ADDLW 0xFF                 
    1741    6CC          3FFF                  ADDLW 0xFF                 
    1742    6CD          3FFF                  ADDLW 0xFF                 
    1743    6CE          3FFF                  ADDLW 0xFF                 
    1744    6CF          3FFF                  ADDLW 0xFF                 
    1745    6D0          3FFF                  ADDLW 0xFF                 
    1746    6D1          3FFF                  ADDLW 0xFF                 
    1747    6D2          3FFF                  ADDLW 0xFF                 
    1748    6D3          3FFF                  ADDLW 0xFF                 
    1749    6D4          3FFF                  ADDLW 0xFF                 
    1750    6D5          3FFF                  ADDLW 0xFF                 
    1751    6D6          3FFF                  ADDLW 0xFF                 
    1752    6D7          3FFF                  ADDLW 0xFF                 
    1753    6D8          3FFF                  ADDLW 0xFF                 
    1754    6D9          3FFF                  ADDLW 0xFF                 
    1755    6DA          3FFF                  ADDLW 0xFF                 
    1756    6DB          3FFF                  ADDLW 0xFF                 
    1757    6DC          3FFF                  ADDLW 0xFF                 
    1758    6DD          3FFF                  ADDLW 0xFF                 
    1759    6DE          3FFF                  ADDLW 0xFF                 
    1760    6DF          3FFF                  ADDLW 0xFF                 
    1761    6E0          3FFF                  ADDLW 0xFF                 
    1762    6E1          3FFF                  ADDLW 0xFF                 
    1763    6E2          3FFF                  ADDLW 0xFF                 
    1764    6E3          3FFF                  ADDLW 0xFF                 
    1765    6E4          3FFF                  ADDLW 0xFF                 
    1766    6E5          3FFF                  ADDLW 0xFF                 
    1767    6E6          3FFF                  ADDLW 0xFF                 
    1768    6E7          3FFF                  ADDLW 0xFF                 
    1769    6E8          3FFF                  ADDLW 0xFF                 
    1770    6E9          3FFF                  ADDLW 0xFF                 
    1771    6EA          3FFF                  ADDLW 0xFF                 
    1772    6EB          3FFF                  ADDLW 0xFF                 
    1773    6EC          3FFF                  ADDLW 0xFF                 
    1774    6ED          3FFF                  ADDLW 0xFF                 
    1775    6EE          3FFF                  ADDLW 0xFF                 
    1776    6EF          3FFF                  ADDLW 0xFF                 
    1777    6F0          3FFF                  ADDLW 0xFF                 
    1778    6F1          3FFF                  ADDLW 0xFF                 
    1779    6F2          3FFF                  ADDLW 0xFF                 
    1780    6F3          3FFF                  ADDLW 0xFF                 
    1781    6F4          3FFF                  ADDLW 0xFF                 
    1782    6F5          3FFF                  ADDLW 0xFF                 
    1783    6F6          3FFF                  ADDLW 0xFF                 
    1784    6F7          3FFF                  ADDLW 0xFF                 
    1785    6F8          3FFF                  ADDLW 0xFF                 
    1786    6F9          3FFF                  ADDLW 0xFF                 
    1787    6FA          3FFF                  ADDLW 0xFF                 
    1788    6FB          3FFF                  ADDLW 0xFF                 
    1789    6FC          3FFF                  ADDLW 0xFF                 
    1790    6FD          3FFF                  ADDLW 0xFF                 
    1791    6FE          3FFF                  ADDLW 0xFF                 
    1792    6FF          3FFF                  ADDLW 0xFF                 
    1793    700          3FFF                  ADDLW 0xFF                 
    1794    701          3FFF                  ADDLW 0xFF                 
    1795    702          3FFF                  ADDLW 0xFF                 
    1796    703          3FFF                  ADDLW 0xFF                 
    1797    704          3FFF                  ADDLW 0xFF                 
    1798    705          3FFF                  ADDLW 0xFF                 
    1799    706          3FFF                  ADDLW 0xFF                 
    1800    707          3FFF                  ADDLW 0xFF                 
    1801    708          3FFF                  ADDLW 0xFF                 
    1802    709          3FFF                  ADDLW 0xFF                 
    1803    70A          3FFF                  ADDLW 0xFF                 
    1804    70B          3FFF                  ADDLW 0xFF                 
    1805    70C          3FFF                  ADDLW 0xFF                 
    1806    70D          3FFF                  ADDLW 0xFF                 
    1807    70E          3FFF                  ADDLW 0xFF                 
    1808    70F          3FFF                  ADDLW 0xFF                 
    1809    710          3FFF                  ADDLW 0xFF                 
    1810    711          3FFF                  ADDLW 0xFF                 
    1811    712          3FFF                  ADDLW 0xFF                 
    1812    713          3FFF                  ADDLW 0xFF                 
    1813    714          3FFF                  ADDLW 0xFF                 
    1814    715          3FFF                  ADDLW 0xFF                 
    1815    716          3FFF                  ADDLW 0xFF                 
    1816    717          3FFF                  ADDLW 0xFF                 
    1817    718          3FFF                  ADDLW 0xFF                 
    1818    719          3FFF                  ADDLW 0xFF                 
    1819    71A          3FFF                  ADDLW 0xFF                 
    1820    71B          3FFF                  ADDLW 0xFF                 
    1821    71C          3FFF                  ADDLW 0xFF                 
    1822    71D          3FFF                  ADDLW 0xFF                 
    1823    71E          3FFF                  ADDLW 0xFF                 
    1824    71F          3FFF                  ADDLW 0xFF                 
    1825    720          3FFF                  ADDLW 0xFF                 
    1826    721          3FFF                  ADDLW 0xFF                 
    1827    722          3FFF                  ADDLW 0xFF                 
    1828    723          3FFF                  ADDLW 0xFF                 
    1829    724          3FFF                  ADDLW 0xFF                 
    1830    725          3FFF                  ADDLW 0xFF                 
    1831    726          3FFF                  ADDLW 0xFF                 
    1832    727          3FFF                  ADDLW 0xFF                 
    1833    728          3FFF                  ADDLW 0xFF                 
    1834    729          3FFF                  ADDLW 0xFF                 
    1835    72A          3FFF                  ADDLW 0xFF                 
    1836    72B          3FFF                  ADDLW 0xFF                 
    1837    72C          3FFF                  ADDLW 0xFF                 
    1838    72D          3FFF                  ADDLW 0xFF                 
    1839    72E          3FFF                  ADDLW 0xFF                 
    1840    72F          3FFF                  ADDLW 0xFF                 
    1841    730          3FFF                  ADDLW 0xFF                 
    1842    731          3FFF                  ADDLW 0xFF                 
    1843    732          3FFF                  ADDLW 0xFF                 
    1844    733          3FFF                  ADDLW 0xFF                 
    1845    734          3FFF                  ADDLW 0xFF                 
    1846    735          3FFF                  ADDLW 0xFF                 
    1847    736          3FFF                  ADDLW 0xFF                 
    1848    737          3FFF                  ADDLW 0xFF                 
    1849    738          3FFF                  ADDLW 0xFF                 
    1850    739          3FFF                  ADDLW 0xFF                 
    1851    73A          3FFF                  ADDLW 0xFF                 
    1852    73B          3FFF                  ADDLW 0xFF                 
    1853    73C          3FFF                  ADDLW 0xFF                 
    1854    73D          3FFF                  ADDLW 0xFF                 
    1855    73E          3FFF                  ADDLW 0xFF                 
    1856    73F          3FFF                  ADDLW 0xFF                 
    1857    740          3FFF                  ADDLW 0xFF                 
    1858    741          3FFF                  ADDLW 0xFF                 
    1859    742          3FFF                  ADDLW 0xFF                 
    1860    743          3FFF                  ADDLW 0xFF                 
    1861    744          3FFF                  ADDLW 0xFF                 
    1862    745          3FFF                  ADDLW 0xFF                 
    1863    746          3FFF                  ADDLW 0xFF                 
    1864    747          3FFF                  ADDLW 0xFF                 
    1865    748          3FFF                  ADDLW 0xFF                 
    1866    749          3FFF                  ADDLW 0xFF                 
    1867    74A          3FFF                  ADDLW 0xFF                 
    1868    74B          3FFF                  ADDLW 0xFF                 
    1869    74C          3FFF                  ADDLW 0xFF                 
    1870    74D          3FFF                  ADDLW 0xFF                 
    1871    74E          3FFF                  ADDLW 0xFF                 
    1872    74F          3FFF                  ADDLW 0xFF                 
    1873    750          3FFF                  ADDLW 0xFF                 
    1874    751          3FFF                  ADDLW 0xFF                 
    1875    752          3FFF                  ADDLW 0xFF                 
    1876    753          3FFF                  ADDLW 0xFF                 
    1877    754          3FFF                  ADDLW 0xFF                 
    1878    755          3FFF                  ADDLW 0xFF                 
    1879    756          3FFF                  ADDLW 0xFF                 
    1880    757          3FFF                  ADDLW 0xFF                 
    1881    758          3FFF                  ADDLW 0xFF                 
    1882    759          3FFF                  ADDLW 0xFF                 
    1883    75A          3FFF                  ADDLW 0xFF                 
    1884    75B          3FFF                  ADDLW 0xFF                 
    1885    75C          3FFF                  ADDLW 0xFF                 
    1886    75D          3FFF                  ADDLW 0xFF                 
    1887    75E          3FFF                  ADDLW 0xFF                 
    1888    75F          3FFF                  ADDLW 0xFF                 
    1889    760          3FFF                  ADDLW 0xFF                 
    1890    761          3FFF                  ADDLW 0xFF                 
    1891    762          3FFF                  ADDLW 0xFF                 
    1892    763          3FFF                  ADDLW 0xFF                 
    1893    764          3FFF                  ADDLW 0xFF                 
    1894    765          3FFF                  ADDLW 0xFF                 
    1895    766          3FFF                  ADDLW 0xFF                 
    1896    767          3FFF                  ADDLW 0xFF                 
    1897    768          3FFF                  ADDLW 0xFF                 
    1898    769          3FFF                  ADDLW 0xFF                 
    1899    76A          3FFF                  ADDLW 0xFF                 
    1900    76B          3FFF                  ADDLW 0xFF                 
    1901    76C          3FFF                  ADDLW 0xFF                 
    1902    76D          3FFF                  ADDLW 0xFF                 
    1903    76E          3FFF                  ADDLW 0xFF                 
    1904    76F          3FFF                  ADDLW 0xFF                 
    1905    770          3FFF                  ADDLW 0xFF                 
    1906    771          3FFF                  ADDLW 0xFF                 
    1907    772          3FFF                  ADDLW 0xFF                 
    1908    773          3FFF                  ADDLW 0xFF                 
    1909    774          3FFF                  ADDLW 0xFF                 
    1910    775          3FFF                  ADDLW 0xFF                 
    1911    776          3FFF                  ADDLW 0xFF                 
    1912    777          3FFF                  ADDLW 0xFF                 
    1913    778          3FFF                  ADDLW 0xFF                 
    1914    779          3FFF                  ADDLW 0xFF                 
    1915    77A          3FFF                  ADDLW 0xFF                 
    1916    77B          3FFF                  ADDLW 0xFF                 
    1917    77C          3FFF                  ADDLW 0xFF                 
    1918    77D          3FFF                  ADDLW 0xFF                 
    1919    77E          3FFF                  ADDLW 0xFF                 
    1920    77F          3FFF                  ADDLW 0xFF                 
    1921    780          3FFF                  ADDLW 0xFF                 
    1922    781          3FFF                  ADDLW 0xFF                 
    1923    782          3FFF                  ADDLW 0xFF                 
    1924    783          3FFF                  ADDLW 0xFF                 
    1925    784          3FFF                  ADDLW 0xFF                 
    1926    785          3FFF                  ADDLW 0xFF                 
    1927    786          3FFF                  ADDLW 0xFF                 
    1928    787          3FFF                  ADDLW 0xFF                 
    1929    788          3FFF                  ADDLW 0xFF                 
    1930    789          3FFF                  ADDLW 0xFF                 
    1931    78A          3FFF                  ADDLW 0xFF                 
    1932    78B          3FFF                  ADDLW 0xFF                 
    1933    78C          3FFF                  ADDLW 0xFF                 
    1934    78D          3FFF                  ADDLW 0xFF                 
    1935    78E          3FFF                  ADDLW 0xFF                 
    1936    78F          3FFF                  ADDLW 0xFF                 
    1937    790          3FFF                  ADDLW 0xFF                 
    1938    791          3FFF                  ADDLW 0xFF                 
    1939    792          3FFF                  ADDLW 0xFF                 
    1940    793          3FFF                  ADDLW 0xFF                 
    1941    794          3FFF                  ADDLW 0xFF                 
    1942    795          3FFF                  ADDLW 0xFF                 
    1943    796          3FFF                  ADDLW 0xFF                 
    1944    797          3FFF                  ADDLW 0xFF                 
    1945    798          3FFF                  ADDLW 0xFF                 
    1946    799          3FFF                  ADDLW 0xFF                 
    1947    79A          3FFF                  ADDLW 0xFF                 
    1948    79B          3FFF                  ADDLW 0xFF                 
    1949    79C          3FFF                  ADDLW 0xFF                 
    1950    79D          3FFF                  ADDLW 0xFF                 
    1951    79E          3FFF                  ADDLW 0xFF                 
    1952    79F          3FFF                  ADDLW 0xFF                 
    1953    7A0          3FFF                  ADDLW 0xFF                 
    1954    7A1          3FFF                  ADDLW 0xFF                 
    1955    7A2          3FFF                  ADDLW 0xFF                 
    1956    7A3          3FFF                  ADDLW 0xFF                 
    1957    7A4          3FFF                  ADDLW 0xFF                 
    1958    7A5          3FFF                  ADDLW 0xFF                 
    1959    7A6          3FFF                  ADDLW 0xFF                 
    1960    7A7          3FFF                  ADDLW 0xFF                 
    1961    7A8          3FFF                  ADDLW 0xFF                 
    1962    7A9          3FFF                  ADDLW 0xFF                 
    1963    7AA          3FFF                  ADDLW 0xFF                 
    1964    7AB          3FFF                  ADDLW 0xFF                 
    1965    7AC          3FFF                  ADDLW 0xFF                 
    1966    7AD          3FFF                  ADDLW 0xFF                 
    1967    7AE          3FFF                  ADDLW 0xFF                 
    1968    7AF          3FFF                  ADDLW 0xFF                 
    1969    7B0          3FFF                  ADDLW 0xFF                 
    1970    7B1          3FFF                  ADDLW 0xFF                 
    1971    7B2          3FFF                  ADDLW 0xFF                 
    1972    7B3          3FFF                  ADDLW 0xFF                 
    1973    7B4          3FFF                  ADDLW 0xFF                 
    1974    7B5          3FFF                  ADDLW 0xFF                 
    1975    7B6          3FFF                  ADDLW 0xFF                 
    1976    7B7          3FFF                  ADDLW 0xFF                 
    1977    7B8          3FFF                  ADDLW 0xFF                 
    1978    7B9          3FFF                  ADDLW 0xFF                 
    1979    7BA          3FFF                  ADDLW 0xFF                 
    1980    7BB          3FFF                  ADDLW 0xFF                 
    1981    7BC          3FFF                  ADDLW 0xFF                 
    1982    7BD          3FFF                  ADDLW 0xFF                 
    1983    7BE          3FFF                  ADDLW 0xFF                 
    1984    7BF          3FFF                  ADDLW 0xFF                 
    1985    7C0          3FFF                  ADDLW 0xFF                 
    1986    7C1          3FFF                  ADDLW 0xFF                 
    1987    7C2          3FFF                  ADDLW 0xFF                 
    1988    7C3          3FFF                  ADDLW 0xFF                 
    1989    7C4          3FFF                  ADDLW 0xFF                 
    1990    7C5          3FFF                  ADDLW 0xFF                 
    1991    7C6          3FFF                  ADDLW 0xFF                 
    1992    7C7          3FFF                  ADDLW 0xFF                 
    1993    7C8          3FFF                  ADDLW 0xFF                 
    1994    7C9          3FFF                  ADDLW 0xFF                 
    1995    7CA          3FFF                  ADDLW 0xFF                 
    1996    7CB          3FFF                  ADDLW 0xFF                 
    1997    7CC          3FFF                  ADDLW 0xFF                 
    1998    7CD          3FFF                  ADDLW 0xFF                 
    1999    7CE          3FFF                  ADDLW 0xFF                 
    2000    7CF          3FFF                  ADDLW 0xFF                 
    2001    7D0          3FFF                  ADDLW 0xFF                 
    2002    7D1          3FFF                  ADDLW 0xFF                 
    2003    7D2          3FFF                  ADDLW 0xFF                 
    2004    7D3          3FFF                  ADDLW 0xFF                 
    2005    7D4          3FFF                  ADDLW 0xFF                 
    2006    7D5          3FFF                  ADDLW 0xFF                 
    2007    7D6          3FFF                  ADDLW 0xFF                 
    2008    7D7          3FFF                  ADDLW 0xFF                 
    2009    7D8          3FFF                  ADDLW 0xFF                 
    2010    7D9          3FFF                  ADDLW 0xFF                 
    2011    7DA          3FFF                  ADDLW 0xFF                 
    2012    7DB          3FFF                  ADDLW 0xFF                 
    2013    7DC          3FFF                  ADDLW 0xFF                 
    2014    7DD          3FFF                  ADDLW 0xFF                 
    2015    7DE          3FFF                  ADDLW 0xFF                 
    2016    7DF          3FFF                  ADDLW 0xFF                 
    2017    7E0          3FFF                  ADDLW 0xFF                 
    2018    7E1          3FFF                  ADDLW 0xFF                 
    2019    7E2          3FFF                  ADDLW 0xFF                 
    2020    7E3          3FFF                  ADDLW 0xFF                 
    2021    7E4          3FFF                  ADDLW 0xFF                 
    2022    7E5          3FFF                  ADDLW 0xFF                 
    2023    7E6          3FFF                  ADDLW 0xFF                 
    2024    7E7          3FFF                  ADDLW 0xFF                 
    2025    7E8          3FFF                  ADDLW 0xFF                 
    2026    7E9          3FFF                  ADDLW 0xFF                 
    2027    7EA          3FFF                  ADDLW 0xFF                 
    2028    7EB          3FFF                  ADDLW 0xFF                 
    2029    7EC          3FFF                  ADDLW 0xFF                 
    2030    7ED          3FFF                  ADDLW 0xFF                 
    2031    7EE          3FFF                  ADDLW 0xFF                 
    2032    7EF          3FFF                  ADDLW 0xFF                 
    2033    7F0          3FFF                  ADDLW 0xFF                 
    2034    7F1          3FFF                  ADDLW 0xFF                 
    2035    7F2          3FFF                  ADDLW 0xFF                 
    2036    7F3          3FFF                  ADDLW 0xFF                 
    2037    7F4          3FFF                  ADDLW 0xFF                 
    2038    7F5          3FFF                  ADDLW 0xFF                 
    2039    7F6          3FFF                  ADDLW 0xFF                 
    2040    7F7          3FFF                  ADDLW 0xFF                 
    2041    7F8          3FFF                  ADDLW 0xFF                 
    2042    7F9          3FFF                  ADDLW 0xFF                 
    2043    7FA          3FFF                  ADDLW 0xFF                 
    2044    7FB          3FFF                  ADDLW 0xFF                 
    2045    7FC          3FFF                  ADDLW 0xFF                 
    2046    7FD          3FFF                  ADDLW 0xFF                 
    2047    7FE          3FFF                  ADDLW 0xFF                 
    2048    7FF          3FFF                  ADDLW 0xFF                 
    2049    800          3FFF                  ADDLW 0xFF                 
    2050    801          3FFF                  ADDLW 0xFF                 
    2051    802          3FFF                  ADDLW 0xFF                 
    2052    803          3FFF                  ADDLW 0xFF                 
    2053    804          3FFF                  ADDLW 0xFF                 
    2054    805          3FFF                  ADDLW 0xFF                 
    2055    806          3FFF                  ADDLW 0xFF                 
    2056    807          3FFF                  ADDLW 0xFF                 
    2057    808          3FFF                  ADDLW 0xFF                 
    2058    809          3FFF                  ADDLW 0xFF                 
    2059    80A          3FFF                  ADDLW 0xFF                 
    2060    80B          3FFF                  ADDLW 0xFF                 
    2061    80C          3FFF                  ADDLW 0xFF                 
    2062    80D          3FFF                  ADDLW 0xFF                 
    2063    80E          3FFF                  ADDLW 0xFF                 
    2064    80F          3FFF                  ADDLW 0xFF                 
    2065    810          3FFF                  ADDLW 0xFF                 
    2066    811          3FFF                  ADDLW 0xFF                 
    2067    812          3FFF                  ADDLW 0xFF                 
    2068    813          3FFF                  ADDLW 0xFF                 
    2069    814          3FFF                  ADDLW 0xFF                 
    2070    815          3FFF                  ADDLW 0xFF                 
    2071    816          3FFF                  ADDLW 0xFF                 
    2072    817          3FFF                  ADDLW 0xFF                 
    2073    818          3FFF                  ADDLW 0xFF                 
    2074    819          3FFF                  ADDLW 0xFF                 
    2075    81A          3FFF                  ADDLW 0xFF                 
    2076    81B          3FFF                  ADDLW 0xFF                 
    2077    81C          3FFF                  ADDLW 0xFF                 
    2078    81D          3FFF                  ADDLW 0xFF                 
    2079    81E          3FFF                  ADDLW 0xFF                 
    2080    81F          3FFF                  ADDLW 0xFF                 
    2081    820          3FFF                  ADDLW 0xFF                 
    2082    821          3FFF                  ADDLW 0xFF                 
    2083    822          3FFF                  ADDLW 0xFF                 
    2084    823          3FFF                  ADDLW 0xFF                 
    2085    824          3FFF                  ADDLW 0xFF                 
    2086    825          3FFF                  ADDLW 0xFF                 
    2087    826          3FFF                  ADDLW 0xFF                 
    2088    827          3FFF                  ADDLW 0xFF                 
    2089    828          3FFF                  ADDLW 0xFF                 
    2090    829          3FFF                  ADDLW 0xFF                 
    2091    82A          3FFF                  ADDLW 0xFF                 
    2092    82B          3FFF                  ADDLW 0xFF                 
    2093    82C          3FFF                  ADDLW 0xFF                 
    2094    82D          3FFF                  ADDLW 0xFF                 
    2095    82E          3FFF                  ADDLW 0xFF                 
    2096    82F          3FFF                  ADDLW 0xFF                 
    2097    830          3FFF                  ADDLW 0xFF                 
    2098    831          3FFF                  ADDLW 0xFF                 
    2099    832          3FFF                  ADDLW 0xFF                 
    2100    833          3FFF                  ADDLW 0xFF                 
    2101    834          3FFF                  ADDLW 0xFF                 
    2102    835          3FFF                  ADDLW 0xFF                 
    2103    836          3FFF                  ADDLW 0xFF                 
    2104    837          3FFF                  ADDLW 0xFF                 
    2105    838          3FFF                  ADDLW 0xFF                 
    2106    839          3FFF                  ADDLW 0xFF                 
    2107    83A          3FFF                  ADDLW 0xFF                 
    2108    83B          3FFF                  ADDLW 0xFF                 
    2109    83C          3FFF                  ADDLW 0xFF                 
    2110    83D          3FFF                  ADDLW 0xFF                 
    2111    83E          3FFF                  ADDLW 0xFF                 
    2112    83F          3FFF                  ADDLW 0xFF                 
    2113    840          3FFF                  ADDLW 0xFF                 
    2114    841          3FFF                  ADDLW 0xFF                 
    2115    842          3FFF                  ADDLW 0xFF                 
    2116    843          3FFF                  ADDLW 0xFF                 
    2117    844          3FFF                  ADDLW 0xFF                 
    2118    845          3FFF                  ADDLW 0xFF                 
    2119    846          3FFF                  ADDLW 0xFF                 
    2120    847          3FFF                  ADDLW 0xFF                 
    2121    848          3FFF                  ADDLW 0xFF                 
    2122    849          3FFF                  ADDLW 0xFF                 
    2123    84A          3FFF                  ADDLW 0xFF                 
    2124    84B          3FFF                  ADDLW 0xFF                 
    2125    84C          3FFF                  ADDLW 0xFF                 
    2126    84D          3FFF                  ADDLW 0xFF                 
    2127    84E          3FFF                  ADDLW 0xFF                 
    2128    84F          3FFF                  ADDLW 0xFF                 
    2129    850          3FFF                  ADDLW 0xFF                 
    2130    851          3FFF                  ADDLW 0xFF                 
    2131    852          3FFF                  ADDLW 0xFF                 
    2132    853          3FFF                  ADDLW 0xFF                 
    2133    854          3FFF                  ADDLW 0xFF                 
    2134    855          3FFF                  ADDLW 0xFF                 
    2135    856          3FFF                  ADDLW 0xFF                 
    2136    857          3FFF                  ADDLW 0xFF                 
    2137    858          3FFF                  ADDLW 0xFF                 
    2138    859          3FFF                  ADDLW 0xFF                 
    2139    85A          3FFF                  ADDLW 0xFF                 
    2140    85B          3FFF                  ADDLW 0xFF                 
    2141    85C          3FFF                  ADDLW 0xFF                 
    2142    85D          3FFF                  ADDLW 0xFF                 
    2143    85E          3FFF                  ADDLW 0xFF                 
    2144    85F          3FFF                  ADDLW 0xFF                 
    2145    860          3FFF                  ADDLW 0xFF                 
    2146    861          3FFF                  ADDLW 0xFF                 
    2147    862          3FFF                  ADDLW 0xFF                 
    2148    863          3FFF                  ADDLW 0xFF                 
    2149    864          3FFF                  ADDLW 0xFF                 
    2150    865          3FFF                  ADDLW 0xFF                 
    2151    866          3FFF                  ADDLW 0xFF                 
    2152    867          3FFF                  ADDLW 0xFF                 
    2153    868          3FFF                  ADDLW 0xFF                 
    2154    869          3FFF                  ADDLW 0xFF                 
    2155    86A          3FFF                  ADDLW 0xFF                 
    2156    86B          3FFF                  ADDLW 0xFF                 
    2157    86C          3FFF                  ADDLW 0xFF                 
    2158    86D          3FFF                  ADDLW 0xFF                 
    2159    86E          3FFF                  ADDLW 0xFF                 
    2160    86F          3FFF                  ADDLW 0xFF                 
    2161    870          3FFF                  ADDLW 0xFF                 
    2162    871          3FFF                  ADDLW 0xFF                 
    2163    872          3FFF                  ADDLW 0xFF                 
    2164    873          3FFF                  ADDLW 0xFF                 
    2165    874          3FFF                  ADDLW 0xFF                 
    2166    875          3FFF                  ADDLW 0xFF                 
    2167    876          3FFF                  ADDLW 0xFF                 
    2168    877          3FFF                  ADDLW 0xFF                 
    2169    878          3FFF                  ADDLW 0xFF                 
    2170    879          3FFF                  ADDLW 0xFF                 
    2171    87A          3FFF                  ADDLW 0xFF                 
    2172    87B          3FFF                  ADDLW 0xFF                 
    2173    87C          3FFF                  ADDLW 0xFF                 
    2174    87D          3FFF                  ADDLW 0xFF                 
    2175    87E          3FFF                  ADDLW 0xFF                 
    2176    87F          3FFF                  ADDLW 0xFF                 
    2177    880          3FFF                  ADDLW 0xFF                 
    2178    881          3FFF                  ADDLW 0xFF                 
    2179    882          3FFF                  ADDLW 0xFF                 
    2180    883          3FFF                  ADDLW 0xFF                 
    2181    884          3FFF                  ADDLW 0xFF                 
    2182    885          3FFF                  ADDLW 0xFF                 
    2183    886          3FFF                  ADDLW 0xFF                 
    2184    887          3FFF                  ADDLW 0xFF                 
    2185    888          3FFF                  ADDLW 0xFF                 
    2186    889          3FFF                  ADDLW 0xFF                 
    2187    88A          3FFF                  ADDLW 0xFF                 
    2188    88B          3FFF                  ADDLW 0xFF                 
    2189    88C          3FFF                  ADDLW 0xFF                 
    2190    88D          3FFF                  ADDLW 0xFF                 
    2191    88E          3FFF                  ADDLW 0xFF                 
    2192    88F          3FFF                  ADDLW 0xFF                 
    2193    890          3FFF                  ADDLW 0xFF                 
    2194    891          3FFF                  ADDLW 0xFF                 
    2195    892          3FFF                  ADDLW 0xFF                 
    2196    893          3FFF                  ADDLW 0xFF                 
    2197    894          3FFF                  ADDLW 0xFF                 
    2198    895          3FFF                  ADDLW 0xFF                 
    2199    896          3FFF                  ADDLW 0xFF                 
    2200    897          3FFF                  ADDLW 0xFF                 
    2201    898          3FFF                  ADDLW 0xFF                 
    2202    899          3FFF                  ADDLW 0xFF                 
    2203    89A          3FFF                  ADDLW 0xFF                 
    2204    89B          3FFF                  ADDLW 0xFF                 
    2205    89C          3FFF                  ADDLW 0xFF                 
    2206    89D          3FFF                  ADDLW 0xFF                 
    2207    89E          3FFF                  ADDLW 0xFF                 
    2208    89F          3FFF                  ADDLW 0xFF                 
    2209    8A0          3FFF                  ADDLW 0xFF                 
    2210    8A1          3FFF                  ADDLW 0xFF                 
    2211    8A2          3FFF                  ADDLW 0xFF                 
    2212    8A3          3FFF                  ADDLW 0xFF                 
    2213    8A4          3FFF                  ADDLW 0xFF                 
    2214    8A5          3FFF                  ADDLW 0xFF                 
    2215    8A6          3FFF                  ADDLW 0xFF                 
    2216    8A7          3FFF                  ADDLW 0xFF                 
    2217    8A8          3FFF                  ADDLW 0xFF                 
    2218    8A9          3FFF                  ADDLW 0xFF                 
    2219    8AA          3FFF                  ADDLW 0xFF                 
    2220    8AB          3FFF                  ADDLW 0xFF                 
    2221    8AC          3FFF                  ADDLW 0xFF                 
    2222    8AD          3FFF                  ADDLW 0xFF                 
    2223    8AE          3FFF                  ADDLW 0xFF                 
    2224    8AF          3FFF                  ADDLW 0xFF                 
    2225    8B0          3FFF                  ADDLW 0xFF                 
    2226    8B1          3FFF                  ADDLW 0xFF                 
    2227    8B2          3FFF                  ADDLW 0xFF                 
    2228    8B3          3FFF                  ADDLW 0xFF                 
    2229    8B4          3FFF                  ADDLW 0xFF                 
    2230    8B5          3FFF                  ADDLW 0xFF                 
    2231    8B6          3FFF                  ADDLW 0xFF                 
    2232    8B7          3FFF                  ADDLW 0xFF                 
    2233    8B8          3FFF                  ADDLW 0xFF                 
    2234    8B9          3FFF                  ADDLW 0xFF                 
    2235    8BA          3FFF                  ADDLW 0xFF                 
    2236    8BB          3FFF                  ADDLW 0xFF                 
    2237    8BC          3FFF                  ADDLW 0xFF                 
    2238    8BD          3FFF                  ADDLW 0xFF                 
    2239    8BE          3FFF                  ADDLW 0xFF                 
    2240    8BF          3FFF                  ADDLW 0xFF                 
    2241    8C0          3FFF                  ADDLW 0xFF                 
    2242    8C1          3FFF                  ADDLW 0xFF                 
    2243    8C2          3FFF                  ADDLW 0xFF                 
    2244    8C3          3FFF                  ADDLW 0xFF                 
    2245    8C4          3FFF                  ADDLW 0xFF                 
    2246    8C5          3FFF                  ADDLW 0xFF                 
    2247    8C6          3FFF                  ADDLW 0xFF                 
    2248    8C7          3FFF                  ADDLW 0xFF                 
    2249    8C8          3FFF                  ADDLW 0xFF                 
    2250    8C9          3FFF                  ADDLW 0xFF                 
    2251    8CA          3FFF                  ADDLW 0xFF                 
    2252    8CB          3FFF                  ADDLW 0xFF                 
    2253    8CC          3FFF                  ADDLW 0xFF                 
    2254    8CD          3FFF                  ADDLW 0xFF                 
    2255    8CE          3FFF                  ADDLW 0xFF                 
    2256    8CF          3FFF                  ADDLW 0xFF                 
    2257    8D0          3FFF                  ADDLW 0xFF                 
    2258    8D1          3FFF                  ADDLW 0xFF                 
    2259    8D2          3FFF                  ADDLW 0xFF                 
    2260    8D3          3FFF                  ADDLW 0xFF                 
    2261    8D4          3FFF                  ADDLW 0xFF                 
    2262    8D5          3FFF                  ADDLW 0xFF                 
    2263    8D6          3FFF                  ADDLW 0xFF                 
    2264    8D7          3FFF                  ADDLW 0xFF                 
    2265    8D8          3FFF                  ADDLW 0xFF                 
    2266    8D9          3FFF                  ADDLW 0xFF                 
    2267    8DA          3FFF                  ADDLW 0xFF                 
    2268    8DB          3FFF                  ADDLW 0xFF                 
    2269    8DC          3FFF                  ADDLW 0xFF                 
    2270    8DD          3FFF                  ADDLW 0xFF                 
    2271    8DE          3FFF                  ADDLW 0xFF                 
    2272    8DF          3FFF                  ADDLW 0xFF                 
    2273    8E0          3FFF                  ADDLW 0xFF                 
    2274    8E1          3FFF                  ADDLW 0xFF                 
    2275    8E2          3FFF                  ADDLW 0xFF                 
    2276    8E3          3FFF                  ADDLW 0xFF                 
    2277    8E4          3FFF                  ADDLW 0xFF                 
    2278    8E5          3FFF                  ADDLW 0xFF                 
    2279    8E6          3FFF                  ADDLW 0xFF                 
    2280    8E7          3FFF                  ADDLW 0xFF                 
    2281    8E8          3FFF                  ADDLW 0xFF                 
    2282    8E9          3FFF                  ADDLW 0xFF                 
    2283    8EA          3FFF                  ADDLW 0xFF                 
    2284    8EB          3FFF                  ADDLW 0xFF                 
    2285    8EC          3FFF                  ADDLW 0xFF                 
    2286    8ED          3FFF                  ADDLW 0xFF                 
    2287    8EE          3FFF                  ADDLW 0xFF                 
    2288    8EF          3FFF                  ADDLW 0xFF                 
    2289    8F0          3FFF                  ADDLW 0xFF                 
    2290    8F1          3FFF                  ADDLW 0xFF                 
    2291    8F2          3FFF                  ADDLW 0xFF                 
    2292    8F3          3FFF                  ADDLW 0xFF                 
    2293    8F4          3FFF                  ADDLW 0xFF                 
    2294    8F5          3FFF                  ADDLW 0xFF                 
    2295    8F6          3FFF                  ADDLW 0xFF                 
    2296    8F7          3FFF                  ADDLW 0xFF                 
    2297    8F8          3FFF                  ADDLW 0xFF                 
    2298    8F9          3FFF                  ADDLW 0xFF                 
    2299    8FA          3FFF                  ADDLW 0xFF                 
    2300    8FB          3FFF                  ADDLW 0xFF                 
    2301    8FC          3FFF                  ADDLW 0xFF                 
    2302    8FD          3FFF                  ADDLW 0xFF                 
    2303    8FE          3FFF                  ADDLW 0xFF                 
    2304    8FF          3FFF                  ADDLW 0xFF                 
    2305    900          3FFF                  ADDLW 0xFF                 
    2306    901          3FFF                  ADDLW 0xFF                 
    2307    902          3FFF                  ADDLW 0xFF                 
    2308    903          3FFF                  ADDLW 0xFF                 
    2309    904          3FFF                  ADDLW 0xFF                 
    2310    905          3FFF                  ADDLW 0xFF                 
    2311    906          3FFF                  ADDLW 0xFF                 
    2312    907          3FFF                  ADDLW 0xFF                 
    2313    908          3FFF                  ADDLW 0xFF                 
    2314    909          3FFF                  ADDLW 0xFF                 
    2315    90A          3FFF                  ADDLW 0xFF                 
    2316    90B          3FFF                  ADDLW 0xFF                 
    2317    90C          3FFF                  ADDLW 0xFF                 
    2318    90D          3FFF                  ADDLW 0xFF                 
    2319    90E          3FFF                  ADDLW 0xFF                 
    2320    90F          3FFF                  ADDLW 0xFF                 
    2321    910          3FFF                  ADDLW 0xFF                 
    2322    911          3FFF                  ADDLW 0xFF                 
    2323    912          3FFF                  ADDLW 0xFF                 
    2324    913          3FFF                  ADDLW 0xFF                 
    2325    914          3FFF                  ADDLW 0xFF                 
    2326    915          3FFF                  ADDLW 0xFF                 
    2327    916          3FFF                  ADDLW 0xFF                 
    2328    917          3FFF                  ADDLW 0xFF                 
    2329    918          3FFF                  ADDLW 0xFF                 
    2330    919          3FFF                  ADDLW 0xFF                 
    2331    91A          3FFF                  ADDLW 0xFF                 
    2332    91B          3FFF                  ADDLW 0xFF                 
    2333    91C          3FFF                  ADDLW 0xFF                 
    2334    91D          3FFF                  ADDLW 0xFF                 
    2335    91E          3FFF                  ADDLW 0xFF                 
    2336    91F          3FFF                  ADDLW 0xFF                 
    2337    920          3FFF                  ADDLW 0xFF                 
    2338    921          3FFF                  ADDLW 0xFF                 
    2339    922          3FFF                  ADDLW 0xFF                 
    2340    923          3FFF                  ADDLW 0xFF                 
    2341    924          3FFF                  ADDLW 0xFF                 
    2342    925          3FFF                  ADDLW 0xFF                 
    2343    926          3FFF                  ADDLW 0xFF                 
    2344    927          3FFF                  ADDLW 0xFF                 
    2345    928          3FFF                  ADDLW 0xFF                 
    2346    929          3FFF                  ADDLW 0xFF                 
    2347    92A          3FFF                  ADDLW 0xFF                 
    2348    92B          3FFF                  ADDLW 0xFF                 
    2349    92C          3FFF                  ADDLW 0xFF                 
    2350    92D          3FFF                  ADDLW 0xFF                 
    2351    92E          3FFF                  ADDLW 0xFF                 
    2352    92F          3FFF                  ADDLW 0xFF                 
    2353    930          3FFF                  ADDLW 0xFF                 
    2354    931          3FFF                  ADDLW 0xFF                 
    2355    932          3FFF                  ADDLW 0xFF                 
    2356    933          3FFF                  ADDLW 0xFF                 
    2357    934          3FFF                  ADDLW 0xFF                 
    2358    935          3FFF                  ADDLW 0xFF                 
    2359    936          3FFF                  ADDLW 0xFF                 
    2360    937          3FFF                  ADDLW 0xFF                 
    2361    938          3FFF                  ADDLW 0xFF                 
    2362    939          3FFF                  ADDLW 0xFF                 
    2363    93A          3FFF                  ADDLW 0xFF                 
    2364    93B          3FFF                  ADDLW 0xFF                 
    2365    93C          3FFF                  ADDLW 0xFF                 
    2366    93D          3FFF                  ADDLW 0xFF                 
    2367    93E          3FFF                  ADDLW 0xFF                 
    2368    93F          3FFF                  ADDLW 0xFF                 
    2369    940          3FFF                  ADDLW 0xFF                 
    2370    941          3FFF                  ADDLW 0xFF                 
    2371    942          3FFF                  ADDLW 0xFF                 
    2372    943          3FFF                  ADDLW 0xFF                 
    2373    944          3FFF                  ADDLW 0xFF                 
    2374    945          3FFF                  ADDLW 0xFF                 
    2375    946          3FFF                  ADDLW 0xFF                 
    2376    947          3FFF                  ADDLW 0xFF                 
    2377    948          3FFF                  ADDLW 0xFF                 
    2378    949          3FFF                  ADDLW 0xFF                 
    2379    94A          3FFF                  ADDLW 0xFF                 
    2380    94B          3FFF                  ADDLW 0xFF                 
    2381    94C          3FFF                  ADDLW 0xFF                 
    2382    94D          3FFF                  ADDLW 0xFF                 
    2383    94E          3FFF                  ADDLW 0xFF                 
    2384    94F          3FFF                  ADDLW 0xFF                 
    2385    950          3FFF                  ADDLW 0xFF                 
    2386    951          3FFF                  ADDLW 0xFF                 
    2387    952          3FFF                  ADDLW 0xFF                 
    2388    953          3FFF                  ADDLW 0xFF                 
    2389    954          3FFF                  ADDLW 0xFF                 
    2390    955          3FFF                  ADDLW 0xFF                 
    2391    956          3FFF                  ADDLW 0xFF                 
    2392    957          3FFF                  ADDLW 0xFF                 
    2393    958          3FFF                  ADDLW 0xFF                 
    2394    959          3FFF                  ADDLW 0xFF                 
    2395    95A          3FFF                  ADDLW 0xFF                 
    2396    95B          3FFF                  ADDLW 0xFF                 
    2397    95C          3FFF                  ADDLW 0xFF                 
    2398    95D          3FFF                  ADDLW 0xFF                 
    2399    95E          3FFF                  ADDLW 0xFF                 
    2400    95F          3FFF                  ADDLW 0xFF                 
    2401    960          3FFF                  ADDLW 0xFF                 
    2402    961          3FFF                  ADDLW 0xFF                 
    2403    962          3FFF                  ADDLW 0xFF                 
    2404    963          3FFF                  ADDLW 0xFF                 
    2405    964          3FFF                  ADDLW 0xFF                 
    2406    965          3FFF                  ADDLW 0xFF                 
    2407    966          3FFF                  ADDLW 0xFF                 
    2408    967          3FFF                  ADDLW 0xFF                 
    2409    968          3FFF                  ADDLW 0xFF                 
    2410    969          3FFF                  ADDLW 0xFF                 
    2411    96A          3FFF                  ADDLW 0xFF                 
    2412    96B          3FFF                  ADDLW 0xFF                 
    2413    96C          3FFF                  ADDLW 0xFF                 
    2414    96D          3FFF                  ADDLW 0xFF                 
    2415    96E          3FFF                  ADDLW 0xFF                 
    2416    96F          3FFF                  ADDLW 0xFF                 
    2417    970          3FFF                  ADDLW 0xFF                 
    2418    971          3FFF                  ADDLW 0xFF                 
    2419    972          3FFF                  ADDLW 0xFF                 
    2420    973          3FFF                  ADDLW 0xFF                 
    2421    974          3FFF                  ADDLW 0xFF                 
    2422    975          3FFF                  ADDLW 0xFF                 
    2423    976          3FFF                  ADDLW 0xFF                 
    2424    977          3FFF                  ADDLW 0xFF                 
    2425    978          3FFF                  ADDLW 0xFF                 
    2426    979          3FFF                  ADDLW 0xFF                 
    2427    97A          3FFF                  ADDLW 0xFF                 
    2428    97B          3FFF                  ADDLW 0xFF                 
    2429    97C          3FFF                  ADDLW 0xFF                 
    2430    97D          3FFF                  ADDLW 0xFF                 
    2431    97E          3FFF                  ADDLW 0xFF                 
    2432    97F          3FFF                  ADDLW 0xFF                 
    2433    980          3FFF                  ADDLW 0xFF                 
    2434    981          3FFF                  ADDLW 0xFF                 
    2435    982          3FFF                  ADDLW 0xFF                 
    2436    983          3FFF                  ADDLW 0xFF                 
    2437    984          3FFF                  ADDLW 0xFF                 
    2438    985          3FFF                  ADDLW 0xFF                 
    2439    986          3FFF                  ADDLW 0xFF                 
    2440    987          3FFF                  ADDLW 0xFF                 
    2441    988          3FFF                  ADDLW 0xFF                 
    2442    989          3FFF                  ADDLW 0xFF                 
    2443    98A          3FFF                  ADDLW 0xFF                 
    2444    98B          3FFF                  ADDLW 0xFF                 
    2445    98C          3FFF                  ADDLW 0xFF                 
    2446    98D          3FFF                  ADDLW 0xFF                 
    2447    98E          3FFF                  ADDLW 0xFF                 
    2448    98F          3FFF                  ADDLW 0xFF                 
    2449    990          3FFF                  ADDLW 0xFF                 
    2450    991          3FFF                  ADDLW 0xFF                 
    2451    992          3FFF                  ADDLW 0xFF                 
    2452    993          3FFF                  ADDLW 0xFF                 
    2453    994          3FFF                  ADDLW 0xFF                 
    2454    995          3FFF                  ADDLW 0xFF                 
    2455    996          3FFF                  ADDLW 0xFF                 
    2456    997          3FFF                  ADDLW 0xFF                 
    2457    998          3FFF                  ADDLW 0xFF                 
    2458    999          3FFF                  ADDLW 0xFF                 
    2459    99A          3FFF                  ADDLW 0xFF                 
    2460    99B          3FFF                  ADDLW 0xFF                 
    2461    99C          3FFF                  ADDLW 0xFF                 
    2462    99D          3FFF                  ADDLW 0xFF                 
    2463    99E          3FFF                  ADDLW 0xFF                 
    2464    99F          3FFF                  ADDLW 0xFF                 
    2465    9A0          3FFF                  ADDLW 0xFF                 
    2466    9A1          3FFF                  ADDLW 0xFF                 
    2467    9A2          3FFF                  ADDLW 0xFF                 
    2468    9A3          3FFF                  ADDLW 0xFF                 
    2469    9A4          3FFF                  ADDLW 0xFF                 
    2470    9A5          3FFF                  ADDLW 0xFF                 
    2471    9A6          3FFF                  ADDLW 0xFF                 
    2472    9A7          3FFF                  ADDLW 0xFF                 
    2473    9A8          3FFF                  ADDLW 0xFF                 
    2474    9A9          3FFF                  ADDLW 0xFF                 
    2475    9AA          3FFF                  ADDLW 0xFF                 
    2476    9AB          3FFF                  ADDLW 0xFF                 
    2477    9AC          3FFF                  ADDLW 0xFF                 
    2478    9AD          3FFF                  ADDLW 0xFF                 
    2479    9AE          3FFF                  ADDLW 0xFF                 
    2480    9AF          3FFF                  ADDLW 0xFF                 
    2481    9B0          3FFF                  ADDLW 0xFF                 
    2482    9B1          3FFF                  ADDLW 0xFF                 
    2483    9B2          3FFF                  ADDLW 0xFF                 
    2484    9B3          3FFF                  ADDLW 0xFF                 
    2485    9B4          3FFF                  ADDLW 0xFF                 
    2486    9B5          3FFF                  ADDLW 0xFF                 
    2487    9B6          3FFF                  ADDLW 0xFF                 
    2488    9B7          3FFF                  ADDLW 0xFF                 
    2489    9B8          3FFF                  ADDLW 0xFF                 
    2490    9B9          3FFF                  ADDLW 0xFF                 
    2491    9BA          3FFF                  ADDLW 0xFF                 
    2492    9BB          3FFF                  ADDLW 0xFF                 
    2493    9BC          3FFF                  ADDLW 0xFF                 
    2494    9BD          3FFF                  ADDLW 0xFF                 
    2495    9BE          3FFF                  ADDLW 0xFF                 
    2496    9BF          3FFF                  ADDLW 0xFF                 
    2497    9C0          3FFF                  ADDLW 0xFF                 
    2498    9C1          3FFF                  ADDLW 0xFF                 
    2499    9C2          3FFF                  ADDLW 0xFF                 
    2500    9C3          3FFF                  ADDLW 0xFF                 
    2501    9C4          3FFF                  ADDLW 0xFF                 
    2502    9C5          3FFF                  ADDLW 0xFF                 
    2503    9C6          3FFF                  ADDLW 0xFF                 
    2504    9C7          3FFF                  ADDLW 0xFF                 
    2505    9C8          3FFF                  ADDLW 0xFF                 
    2506    9C9          3FFF                  ADDLW 0xFF                 
    2507    9CA          3FFF                  ADDLW 0xFF                 
    2508    9CB          3FFF                  ADDLW 0xFF                 
    2509    9CC          3FFF                  ADDLW 0xFF                 
    2510    9CD          3FFF                  ADDLW 0xFF                 
    2511    9CE          3FFF                  ADDLW 0xFF                 
    2512    9CF          3FFF                  ADDLW 0xFF                 
    2513    9D0          3FFF                  ADDLW 0xFF                 
    2514    9D1          3FFF                  ADDLW 0xFF                 
    2515    9D2          3FFF                  ADDLW 0xFF                 
    2516    9D3          3FFF                  ADDLW 0xFF                 
    2517    9D4          3FFF                  ADDLW 0xFF                 
    2518    9D5          3FFF                  ADDLW 0xFF                 
    2519    9D6          3FFF                  ADDLW 0xFF                 
    2520    9D7          3FFF                  ADDLW 0xFF                 
    2521    9D8          3FFF                  ADDLW 0xFF                 
    2522    9D9          3FFF                  ADDLW 0xFF                 
    2523    9DA          3FFF                  ADDLW 0xFF                 
    2524    9DB          3FFF                  ADDLW 0xFF                 
    2525    9DC          3FFF                  ADDLW 0xFF                 
    2526    9DD          3FFF                  ADDLW 0xFF                 
    2527    9DE          3FFF                  ADDLW 0xFF                 
    2528    9DF          3FFF                  ADDLW 0xFF                 
    2529    9E0          3FFF                  ADDLW 0xFF                 
    2530    9E1          3FFF                  ADDLW 0xFF                 
    2531    9E2          3FFF                  ADDLW 0xFF                 
    2532    9E3          3FFF                  ADDLW 0xFF                 
    2533    9E4          3FFF                  ADDLW 0xFF                 
    2534    9E5          3FFF                  ADDLW 0xFF                 
    2535    9E6          3FFF                  ADDLW 0xFF                 
    2536    9E7          3FFF                  ADDLW 0xFF                 
    2537    9E8          3FFF                  ADDLW 0xFF                 
    2538    9E9          3FFF                  ADDLW 0xFF                 
    2539    9EA          3FFF                  ADDLW 0xFF                 
    2540    9EB          3FFF                  ADDLW 0xFF                 
    2541    9EC          3FFF                  ADDLW 0xFF                 
    2542    9ED          3FFF                  ADDLW 0xFF                 
    2543    9EE          3FFF                  ADDLW 0xFF                 
    2544    9EF          3FFF                  ADDLW 0xFF                 
    2545    9F0          3FFF                  ADDLW 0xFF                 
    2546    9F1          3FFF                  ADDLW 0xFF                 
    2547    9F2          3FFF                  ADDLW 0xFF                 
    2548    9F3          3FFF                  ADDLW 0xFF                 
    2549    9F4          3FFF                  ADDLW 0xFF                 
    2550    9F5          3FFF                  ADDLW 0xFF                 
    2551    9F6          3FFF                  ADDLW 0xFF                 
    2552    9F7          3FFF                  ADDLW 0xFF                 
    2553    9F8          3FFF                  ADDLW 0xFF                 
    2554    9F9          3FFF                  ADDLW 0xFF                 
    2555    9FA          3FFF                  ADDLW 0xFF                 
    2556    9FB          3FFF                  ADDLW 0xFF                 
    2557    9FC          3FFF                  ADDLW 0xFF                 
    2558    9FD          3FFF                  ADDLW 0xFF                 
    2559    9FE          3FFF                  ADDLW 0xFF                 
    2560    9FF          3FFF                  ADDLW 0xFF                 
    2561    A00          3FFF                  ADDLW 0xFF                 
    2562    A01          3FFF                  ADDLW 0xFF                 
    2563    A02          3FFF                  ADDLW 0xFF                 
    2564    A03          3FFF                  ADDLW 0xFF                 
    2565    A04          3FFF                  ADDLW 0xFF                 
    2566    A05          3FFF                  ADDLW 0xFF                 
    2567    A06          3FFF                  ADDLW 0xFF                 
    2568    A07          3FFF                  ADDLW 0xFF                 
    2569    A08          3FFF                  ADDLW 0xFF                 
    2570    A09          3FFF                  ADDLW 0xFF                 
    2571    A0A          3FFF                  ADDLW 0xFF                 
    2572    A0B          3FFF                  ADDLW 0xFF                 
    2573    A0C          3FFF                  ADDLW 0xFF                 
    2574    A0D          3FFF                  ADDLW 0xFF                 
    2575    A0E          3FFF                  ADDLW 0xFF                 
    2576    A0F          3FFF                  ADDLW 0xFF                 
    2577    A10          3FFF                  ADDLW 0xFF                 
    2578    A11          3FFF                  ADDLW 0xFF                 
    2579    A12          3FFF                  ADDLW 0xFF                 
    2580    A13          3FFF                  ADDLW 0xFF                 
    2581    A14          3FFF                  ADDLW 0xFF                 
    2582    A15          3FFF                  ADDLW 0xFF                 
    2583    A16          3FFF                  ADDLW 0xFF                 
    2584    A17          3FFF                  ADDLW 0xFF                 
    2585    A18          3FFF                  ADDLW 0xFF                 
    2586    A19          3FFF                  ADDLW 0xFF                 
    2587    A1A          3FFF                  ADDLW 0xFF                 
    2588    A1B          3FFF                  ADDLW 0xFF                 
    2589    A1C          3FFF                  ADDLW 0xFF                 
    2590    A1D          3FFF                  ADDLW 0xFF                 
    2591    A1E          3FFF                  ADDLW 0xFF                 
    2592    A1F          3FFF                  ADDLW 0xFF                 
    2593    A20          3FFF                  ADDLW 0xFF                 
    2594    A21          3FFF                  ADDLW 0xFF                 
    2595    A22          3FFF                  ADDLW 0xFF                 
    2596    A23          3FFF                  ADDLW 0xFF                 
    2597    A24          3FFF                  ADDLW 0xFF                 
    2598    A25          3FFF                  ADDLW 0xFF                 
    2599    A26          3FFF                  ADDLW 0xFF                 
    2600    A27          3FFF                  ADDLW 0xFF                 
    2601    A28          3FFF                  ADDLW 0xFF                 
    2602    A29          3FFF                  ADDLW 0xFF                 
    2603    A2A          3FFF                  ADDLW 0xFF                 
    2604    A2B          3FFF                  ADDLW 0xFF                 
    2605    A2C          3FFF                  ADDLW 0xFF                 
    2606    A2D          3FFF                  ADDLW 0xFF                 
    2607    A2E          3FFF                  ADDLW 0xFF                 
    2608    A2F          3FFF                  ADDLW 0xFF                 
    2609    A30          3FFF                  ADDLW 0xFF                 
    2610    A31          3FFF                  ADDLW 0xFF                 
    2611    A32          3FFF                  ADDLW 0xFF                 
    2612    A33          3FFF                  ADDLW 0xFF                 
    2613    A34          3FFF                  ADDLW 0xFF                 
    2614    A35          3FFF                  ADDLW 0xFF                 
    2615    A36          3FFF                  ADDLW 0xFF                 
    2616    A37          3FFF                  ADDLW 0xFF                 
    2617    A38          3FFF                  ADDLW 0xFF                 
    2618    A39          3FFF                  ADDLW 0xFF                 
    2619    A3A          3FFF                  ADDLW 0xFF                 
    2620    A3B          3FFF                  ADDLW 0xFF                 
    2621    A3C          3FFF                  ADDLW 0xFF                 
    2622    A3D          3FFF                  ADDLW 0xFF                 
    2623    A3E          3FFF                  ADDLW 0xFF                 
    2624    A3F          3FFF                  ADDLW 0xFF                 
    2625    A40          3FFF                  ADDLW 0xFF                 
    2626    A41          3FFF                  ADDLW 0xFF                 
    2627    A42          3FFF                  ADDLW 0xFF                 
    2628    A43          3FFF                  ADDLW 0xFF                 
    2629    A44          3FFF                  ADDLW 0xFF                 
    2630    A45          3FFF                  ADDLW 0xFF                 
    2631    A46          3FFF                  ADDLW 0xFF                 
    2632    A47          3FFF                  ADDLW 0xFF                 
    2633    A48          3FFF                  ADDLW 0xFF                 
    2634    A49          3FFF                  ADDLW 0xFF                 
    2635    A4A          3FFF                  ADDLW 0xFF                 
    2636    A4B          3FFF                  ADDLW 0xFF                 
    2637    A4C          3FFF                  ADDLW 0xFF                 
    2638    A4D          3FFF                  ADDLW 0xFF                 
    2639    A4E          3FFF                  ADDLW 0xFF                 
    2640    A4F          3FFF                  ADDLW 0xFF                 
    2641    A50          3FFF                  ADDLW 0xFF                 
    2642    A51          3FFF                  ADDLW 0xFF                 
    2643    A52          3FFF                  ADDLW 0xFF                 
    2644    A53          3FFF                  ADDLW 0xFF                 
    2645    A54          3FFF                  ADDLW 0xFF                 
    2646    A55          3FFF                  ADDLW 0xFF                 
    2647    A56          3FFF                  ADDLW 0xFF                 
    2648    A57          3FFF                  ADDLW 0xFF                 
    2649    A58          3FFF                  ADDLW 0xFF                 
    2650    A59          3FFF                  ADDLW 0xFF                 
    2651    A5A          3FFF                  ADDLW 0xFF                 
    2652    A5B          3FFF                  ADDLW 0xFF                 
    2653    A5C          3FFF                  ADDLW 0xFF                 
    2654    A5D          3FFF                  ADDLW 0xFF                 
    2655    A5E          3FFF                  ADDLW 0xFF                 
    2656    A5F          3FFF                  ADDLW 0xFF                 
    2657    A60          3FFF                  ADDLW 0xFF                 
    2658    A61          3FFF                  ADDLW 0xFF                 
    2659    A62          3FFF                  ADDLW 0xFF                 
    2660    A63          3FFF                  ADDLW 0xFF                 
    2661    A64          3FFF                  ADDLW 0xFF                 
    2662    A65          3FFF                  ADDLW 0xFF                 
    2663    A66          3FFF                  ADDLW 0xFF                 
    2664    A67          3FFF                  ADDLW 0xFF                 
    2665    A68          3FFF                  ADDLW 0xFF                 
    2666    A69          3FFF                  ADDLW 0xFF                 
    2667    A6A          3FFF                  ADDLW 0xFF                 
    2668    A6B          3FFF                  ADDLW 0xFF                 
    2669    A6C          3FFF                  ADDLW 0xFF                 
    2670    A6D          3FFF                  ADDLW 0xFF                 
    2671    A6E          3FFF                  ADDLW 0xFF                 
    2672    A6F          3FFF                  ADDLW 0xFF                 
    2673    A70          3FFF                  ADDLW 0xFF                 
    2674    A71          3FFF                  ADDLW 0xFF                 
    2675    A72          3FFF                  ADDLW 0xFF                 
    2676    A73          3FFF                  ADDLW 0xFF                 
    2677    A74          3FFF                  ADDLW 0xFF                 
    2678    A75          3FFF                  ADDLW 0xFF                 
    2679    A76          3FFF                  ADDLW 0xFF                 
    2680    A77          3FFF                  ADDLW 0xFF                 
    2681    A78          3FFF                  ADDLW 0xFF                 
    2682    A79          3FFF                  ADDLW 0xFF                 
    2683    A7A          3FFF                  ADDLW 0xFF                 
    2684    A7B          3FFF                  ADDLW 0xFF                 
    2685    A7C          3FFF                  ADDLW 0xFF                 
    2686    A7D          3FFF                  ADDLW 0xFF                 
    2687    A7E          3FFF                  ADDLW 0xFF                 
    2688    A7F          3FFF                  ADDLW 0xFF                 
    2689    A80          3FFF                  ADDLW 0xFF                 
    2690    A81          3FFF                  ADDLW 0xFF                 
    2691    A82          3FFF                  ADDLW 0xFF                 
    2692    A83          3FFF                  ADDLW 0xFF                 
    2693    A84          3FFF                  ADDLW 0xFF                 
    2694    A85          3FFF                  ADDLW 0xFF                 
    2695    A86          3FFF                  ADDLW 0xFF                 
    2696    A87          3FFF                  ADDLW 0xFF                 
    2697    A88          3FFF                  ADDLW 0xFF                 
    2698    A89          3FFF                  ADDLW 0xFF                 
    2699    A8A          3FFF                  ADDLW 0xFF                 
    2700    A8B          3FFF                  ADDLW 0xFF                 
    2701    A8C          3FFF                  ADDLW 0xFF                 
    2702    A8D          3FFF                  ADDLW 0xFF                 
    2703    A8E          3FFF                  ADDLW 0xFF                 
    2704    A8F          3FFF                  ADDLW 0xFF                 
    2705    A90          3FFF                  ADDLW 0xFF                 
    2706    A91          3FFF                  ADDLW 0xFF                 
    2707    A92          3FFF                  ADDLW 0xFF                 
    2708    A93          3FFF                  ADDLW 0xFF                 
    2709    A94          3FFF                  ADDLW 0xFF                 
    2710    A95          3FFF                  ADDLW 0xFF                 
    2711    A96          3FFF                  ADDLW 0xFF                 
    2712    A97          3FFF                  ADDLW 0xFF                 
    2713    A98          3FFF                  ADDLW 0xFF                 
    2714    A99          3FFF                  ADDLW 0xFF                 
    2715    A9A          3FFF                  ADDLW 0xFF                 
    2716    A9B          3FFF                  ADDLW 0xFF                 
    2717    A9C          3FFF                  ADDLW 0xFF                 
    2718    A9D          3FFF                  ADDLW 0xFF                 
    2719    A9E          3FFF                  ADDLW 0xFF                 
    2720    A9F          3FFF                  ADDLW 0xFF                 
    2721    AA0          3FFF                  ADDLW 0xFF                 
    2722    AA1          3FFF                  ADDLW 0xFF                 
    2723    AA2          3FFF                  ADDLW 0xFF                 
    2724    AA3          3FFF                  ADDLW 0xFF                 
    2725    AA4          3FFF                  ADDLW 0xFF                 
    2726    AA5          3FFF                  ADDLW 0xFF                 
    2727    AA6          3FFF                  ADDLW 0xFF                 
    2728    AA7          3FFF                  ADDLW 0xFF                 
    2729    AA8          3FFF                  ADDLW 0xFF                 
    2730    AA9          3FFF                  ADDLW 0xFF                 
    2731    AAA          3FFF                  ADDLW 0xFF                 
    2732    AAB          3FFF                  ADDLW 0xFF                 
    2733    AAC          3FFF                  ADDLW 0xFF                 
    2734    AAD          3FFF                  ADDLW 0xFF                 
    2735    AAE          3FFF                  ADDLW 0xFF                 
    2736    AAF          3FFF                  ADDLW 0xFF                 
    2737    AB0          3FFF                  ADDLW 0xFF                 
    2738    AB1          3FFF                  ADDLW 0xFF                 
    2739    AB2          3FFF                  ADDLW 0xFF                 
    2740    AB3          3FFF                  ADDLW 0xFF                 
    2741    AB4          3FFF                  ADDLW 0xFF                 
    2742    AB5          3FFF                  ADDLW 0xFF                 
    2743    AB6          3FFF                  ADDLW 0xFF                 
    2744    AB7          3FFF                  ADDLW 0xFF                 
    2745    AB8          3FFF                  ADDLW 0xFF                 
    2746    AB9          3FFF                  ADDLW 0xFF                 
    2747    ABA          3FFF                  ADDLW 0xFF                 
    2748    ABB          3FFF                  ADDLW 0xFF                 
    2749    ABC          3FFF                  ADDLW 0xFF                 
    2750    ABD          3FFF                  ADDLW 0xFF                 
    2751    ABE          3FFF                  ADDLW 0xFF                 
    2752    ABF          3FFF                  ADDLW 0xFF                 
    2753    AC0          3FFF                  ADDLW 0xFF                 
    2754    AC1          3FFF                  ADDLW 0xFF                 
    2755    AC2          3FFF                  ADDLW 0xFF                 
    2756    AC3          3FFF                  ADDLW 0xFF                 
    2757    AC4          3FFF                  ADDLW 0xFF                 
    2758    AC5          3FFF                  ADDLW 0xFF                 
    2759    AC6          3FFF                  ADDLW 0xFF                 
    2760    AC7          3FFF                  ADDLW 0xFF                 
    2761    AC8          3FFF                  ADDLW 0xFF                 
    2762    AC9          3FFF                  ADDLW 0xFF                 
    2763    ACA          3FFF                  ADDLW 0xFF                 
    2764    ACB          3FFF                  ADDLW 0xFF                 
    2765    ACC          3FFF                  ADDLW 0xFF                 
    2766    ACD          3FFF                  ADDLW 0xFF                 
    2767    ACE          3FFF                  ADDLW 0xFF                 
    2768    ACF          3FFF                  ADDLW 0xFF                 
    2769    AD0          3FFF                  ADDLW 0xFF                 
    2770    AD1          3FFF                  ADDLW 0xFF                 
    2771    AD2          3FFF                  ADDLW 0xFF                 
    2772    AD3          3FFF                  ADDLW 0xFF                 
    2773    AD4          3FFF                  ADDLW 0xFF                 
    2774    AD5          3FFF                  ADDLW 0xFF                 
    2775    AD6          3FFF                  ADDLW 0xFF                 
    2776    AD7          3FFF                  ADDLW 0xFF                 
    2777    AD8          3FFF                  ADDLW 0xFF                 
    2778    AD9          3FFF                  ADDLW 0xFF                 
    2779    ADA          3FFF                  ADDLW 0xFF                 
    2780    ADB          3FFF                  ADDLW 0xFF                 
    2781    ADC          3FFF                  ADDLW 0xFF                 
    2782    ADD          3FFF                  ADDLW 0xFF                 
    2783    ADE          3FFF                  ADDLW 0xFF                 
    2784    ADF          3FFF                  ADDLW 0xFF                 
    2785    AE0          3FFF                  ADDLW 0xFF                 
    2786    AE1          3FFF                  ADDLW 0xFF                 
    2787    AE2          3FFF                  ADDLW 0xFF                 
    2788    AE3          3FFF                  ADDLW 0xFF                 
    2789    AE4          3FFF                  ADDLW 0xFF                 
    2790    AE5          3FFF                  ADDLW 0xFF                 
    2791    AE6          3FFF                  ADDLW 0xFF                 
    2792    AE7          3FFF                  ADDLW 0xFF                 
    2793    AE8          3FFF                  ADDLW 0xFF                 
    2794    AE9          3FFF                  ADDLW 0xFF                 
    2795    AEA          3FFF                  ADDLW 0xFF                 
    2796    AEB          3FFF                  ADDLW 0xFF                 
    2797    AEC          3FFF                  ADDLW 0xFF                 
    2798    AED          3FFF                  ADDLW 0xFF                 
    2799    AEE          3FFF                  ADDLW 0xFF                 
    2800    AEF          3FFF                  ADDLW 0xFF                 
    2801    AF0          3FFF                  ADDLW 0xFF                 
    2802    AF1          3FFF                  ADDLW 0xFF                 
    2803    AF2          3FFF                  ADDLW 0xFF                 
    2804    AF3          3FFF                  ADDLW 0xFF                 
    2805    AF4          3FFF                  ADDLW 0xFF                 
    2806    AF5          3FFF                  ADDLW 0xFF                 
    2807    AF6          3FFF                  ADDLW 0xFF                 
    2808    AF7          3FFF                  ADDLW 0xFF                 
    2809    AF8          3FFF                  ADDLW 0xFF                 
    2810    AF9          3FFF                  ADDLW 0xFF                 
    2811    AFA          3FFF                  ADDLW 0xFF                 
    2812    AFB          3FFF                  ADDLW 0xFF                 
    2813    AFC          3FFF                  ADDLW 0xFF                 
    2814    AFD          3FFF                  ADDLW 0xFF                 
    2815    AFE          3FFF                  ADDLW 0xFF                 
    2816    AFF          3FFF                  ADDLW 0xFF                 
    2817    B00          3FFF                  ADDLW 0xFF                 
    2818    B01          3FFF                  ADDLW 0xFF                 
    2819    B02          3FFF                  ADDLW 0xFF                 
    2820    B03          3FFF                  ADDLW 0xFF                 
    2821    B04          3FFF                  ADDLW 0xFF                 
    2822    B05          3FFF                  ADDLW 0xFF                 
    2823    B06          3FFF                  ADDLW 0xFF                 
    2824    B07          3FFF                  ADDLW 0xFF                 
    2825    B08          3FFF                  ADDLW 0xFF                 
    2826    B09          3FFF                  ADDLW 0xFF                 
    2827    B0A          3FFF                  ADDLW 0xFF                 
    2828    B0B          3FFF                  ADDLW 0xFF                 
    2829    B0C          3FFF                  ADDLW 0xFF                 
    2830    B0D          3FFF                  ADDLW 0xFF                 
    2831    B0E          3FFF                  ADDLW 0xFF                 
    2832    B0F          3FFF                  ADDLW 0xFF                 
    2833    B10          3FFF                  ADDLW 0xFF                 
    2834    B11          3FFF                  ADDLW 0xFF                 
    2835    B12          3FFF                  ADDLW 0xFF                 
    2836    B13          3FFF                  ADDLW 0xFF                 
    2837    B14          3FFF                  ADDLW 0xFF                 
    2838    B15          3FFF                  ADDLW 0xFF                 
    2839    B16          3FFF                  ADDLW 0xFF                 
    2840    B17          3FFF                  ADDLW 0xFF                 
    2841    B18          3FFF                  ADDLW 0xFF                 
    2842    B19          3FFF                  ADDLW 0xFF                 
    2843    B1A          3FFF                  ADDLW 0xFF                 
    2844    B1B          3FFF                  ADDLW 0xFF                 
    2845    B1C          3FFF                  ADDLW 0xFF                 
    2846    B1D          3FFF                  ADDLW 0xFF                 
    2847    B1E          3FFF                  ADDLW 0xFF                 
    2848    B1F          3FFF                  ADDLW 0xFF                 
    2849    B20          3FFF                  ADDLW 0xFF                 
    2850    B21          3FFF                  ADDLW 0xFF                 
    2851    B22          3FFF                  ADDLW 0xFF                 
    2852    B23          3FFF                  ADDLW 0xFF                 
    2853    B24          3FFF                  ADDLW 0xFF                 
    2854    B25          3FFF                  ADDLW 0xFF                 
    2855    B26          3FFF                  ADDLW 0xFF                 
    2856    B27          3FFF                  ADDLW 0xFF                 
    2857    B28          3FFF                  ADDLW 0xFF                 
    2858    B29          3FFF                  ADDLW 0xFF                 
    2859    B2A          3FFF                  ADDLW 0xFF                 
    2860    B2B          3FFF                  ADDLW 0xFF                 
    2861    B2C          3FFF                  ADDLW 0xFF                 
    2862    B2D          3FFF                  ADDLW 0xFF                 
    2863    B2E          3FFF                  ADDLW 0xFF                 
    2864    B2F          3FFF                  ADDLW 0xFF                 
    2865    B30          3FFF                  ADDLW 0xFF                 
    2866    B31          3FFF                  ADDLW 0xFF                 
    2867    B32          3FFF                  ADDLW 0xFF                 
    2868    B33          3FFF                  ADDLW 0xFF                 
    2869    B34          3FFF                  ADDLW 0xFF                 
    2870    B35          3FFF                  ADDLW 0xFF                 
    2871    B36          3FFF                  ADDLW 0xFF                 
    2872    B37          3FFF                  ADDLW 0xFF                 
    2873    B38          3FFF                  ADDLW 0xFF                 
    2874    B39          3FFF                  ADDLW 0xFF                 
    2875    B3A          3FFF                  ADDLW 0xFF                 
    2876    B3B          3FFF                  ADDLW 0xFF                 
    2877    B3C          3FFF                  ADDLW 0xFF                 
    2878    B3D          3FFF                  ADDLW 0xFF                 
    2879    B3E          3FFF                  ADDLW 0xFF                 
    2880    B3F          3FFF                  ADDLW 0xFF                 
    2881    B40          3FFF                  ADDLW 0xFF                 
    2882    B41          3FFF                  ADDLW 0xFF                 
    2883    B42          3FFF                  ADDLW 0xFF                 
    2884    B43          3FFF                  ADDLW 0xFF                 
    2885    B44          3FFF                  ADDLW 0xFF                 
    2886    B45          3FFF                  ADDLW 0xFF                 
    2887    B46          3FFF                  ADDLW 0xFF                 
    2888    B47          3FFF                  ADDLW 0xFF                 
    2889    B48          3FFF                  ADDLW 0xFF                 
    2890    B49          3FFF                  ADDLW 0xFF                 
    2891    B4A          3FFF                  ADDLW 0xFF                 
    2892    B4B          3FFF                  ADDLW 0xFF                 
    2893    B4C          3FFF                  ADDLW 0xFF                 
    2894    B4D          3FFF                  ADDLW 0xFF                 
    2895    B4E          3FFF                  ADDLW 0xFF                 
    2896    B4F          3FFF                  ADDLW 0xFF                 
    2897    B50          3FFF                  ADDLW 0xFF                 
    2898    B51          3FFF                  ADDLW 0xFF                 
    2899    B52          3FFF                  ADDLW 0xFF                 
    2900    B53          3FFF                  ADDLW 0xFF                 
    2901    B54          3FFF                  ADDLW 0xFF                 
    2902    B55          3FFF                  ADDLW 0xFF                 
    2903    B56          3FFF                  ADDLW 0xFF                 
    2904    B57          3FFF                  ADDLW 0xFF                 
    2905    B58          3FFF                  ADDLW 0xFF                 
    2906    B59          3FFF                  ADDLW 0xFF                 
    2907    B5A          3FFF                  ADDLW 0xFF                 
    2908    B5B          3FFF                  ADDLW 0xFF                 
    2909    B5C          3FFF                  ADDLW 0xFF                 
    2910    B5D          3FFF                  ADDLW 0xFF                 
    2911    B5E          3FFF                  ADDLW 0xFF                 
    2912    B5F          3FFF                  ADDLW 0xFF                 
    2913    B60          3FFF                  ADDLW 0xFF                 
    2914    B61          3FFF                  ADDLW 0xFF                 
    2915    B62          3FFF                  ADDLW 0xFF                 
    2916    B63          3FFF                  ADDLW 0xFF                 
    2917    B64          3FFF                  ADDLW 0xFF                 
    2918    B65          3FFF                  ADDLW 0xFF                 
    2919    B66          3FFF                  ADDLW 0xFF                 
    2920    B67          3FFF                  ADDLW 0xFF                 
    2921    B68          3FFF                  ADDLW 0xFF                 
    2922    B69          3FFF                  ADDLW 0xFF                 
    2923    B6A          3FFF                  ADDLW 0xFF                 
    2924    B6B          3FFF                  ADDLW 0xFF                 
    2925    B6C          3FFF                  ADDLW 0xFF                 
    2926    B6D          3FFF                  ADDLW 0xFF                 
    2927    B6E          3FFF                  ADDLW 0xFF                 
    2928    B6F          3FFF                  ADDLW 0xFF                 
    2929    B70          3FFF                  ADDLW 0xFF                 
    2930    B71          3FFF                  ADDLW 0xFF                 
    2931    B72          3FFF                  ADDLW 0xFF                 
    2932    B73          3FFF                  ADDLW 0xFF                 
    2933    B74          3FFF                  ADDLW 0xFF                 
    2934    B75          3FFF                  ADDLW 0xFF                 
    2935    B76          3FFF                  ADDLW 0xFF                 
    2936    B77          3FFF                  ADDLW 0xFF                 
    2937    B78          3FFF                  ADDLW 0xFF                 
    2938    B79          3FFF                  ADDLW 0xFF                 
    2939    B7A          3FFF                  ADDLW 0xFF                 
    2940    B7B          3FFF                  ADDLW 0xFF                 
    2941    B7C          3FFF                  ADDLW 0xFF                 
    2942    B7D          3FFF                  ADDLW 0xFF                 
    2943    B7E          3FFF                  ADDLW 0xFF                 
    2944    B7F          3FFF                  ADDLW 0xFF                 
    2945    B80          3FFF                  ADDLW 0xFF                 
    2946    B81          3FFF                  ADDLW 0xFF                 
    2947    B82          3FFF                  ADDLW 0xFF                 
    2948    B83          3FFF                  ADDLW 0xFF                 
    2949    B84          3FFF                  ADDLW 0xFF                 
    2950    B85          3FFF                  ADDLW 0xFF                 
    2951    B86          3FFF                  ADDLW 0xFF                 
    2952    B87          3FFF                  ADDLW 0xFF                 
    2953    B88          3FFF                  ADDLW 0xFF                 
    2954    B89          3FFF                  ADDLW 0xFF                 
    2955    B8A          3FFF                  ADDLW 0xFF                 
    2956    B8B          3FFF                  ADDLW 0xFF                 
    2957    B8C          3FFF                  ADDLW 0xFF                 
    2958    B8D          3FFF                  ADDLW 0xFF                 
    2959    B8E          3FFF                  ADDLW 0xFF                 
    2960    B8F          3FFF                  ADDLW 0xFF                 
    2961    B90          3FFF                  ADDLW 0xFF                 
    2962    B91          3FFF                  ADDLW 0xFF                 
    2963    B92          3FFF                  ADDLW 0xFF                 
    2964    B93          3FFF                  ADDLW 0xFF                 
    2965    B94          3FFF                  ADDLW 0xFF                 
    2966    B95          3FFF                  ADDLW 0xFF                 
    2967    B96          3FFF                  ADDLW 0xFF                 
    2968    B97          3FFF                  ADDLW 0xFF                 
    2969    B98          3FFF                  ADDLW 0xFF                 
    2970    B99          3FFF                  ADDLW 0xFF                 
    2971    B9A          3FFF                  ADDLW 0xFF                 
    2972    B9B          3FFF                  ADDLW 0xFF                 
    2973    B9C          3FFF                  ADDLW 0xFF                 
    2974    B9D          3FFF                  ADDLW 0xFF                 
    2975    B9E          3FFF                  ADDLW 0xFF                 
    2976    B9F          3FFF                  ADDLW 0xFF                 
    2977    BA0          3FFF                  ADDLW 0xFF                 
    2978    BA1          3FFF                  ADDLW 0xFF                 
    2979    BA2          3FFF                  ADDLW 0xFF                 
    2980    BA3          3FFF                  ADDLW 0xFF                 
    2981    BA4          3FFF                  ADDLW 0xFF                 
    2982    BA5          3FFF                  ADDLW 0xFF                 
    2983    BA6          3FFF                  ADDLW 0xFF                 
    2984    BA7          3FFF                  ADDLW 0xFF                 
    2985    BA8          3FFF                  ADDLW 0xFF                 
    2986    BA9          3FFF                  ADDLW 0xFF                 
    2987    BAA          3FFF                  ADDLW 0xFF                 
    2988    BAB          3FFF                  ADDLW 0xFF                 
    2989    BAC          3FFF                  ADDLW 0xFF                 
    2990    BAD          3FFF                  ADDLW 0xFF                 
    2991    BAE          3FFF                  ADDLW 0xFF                 
    2992    BAF          3FFF                  ADDLW 0xFF                 
    2993    BB0          3FFF                  ADDLW 0xFF                 
    2994    BB1          3FFF                  ADDLW 0xFF                 
    2995    BB2          3FFF                  ADDLW 0xFF                 
    2996    BB3          3FFF                  ADDLW 0xFF                 
    2997    BB4          3FFF                  ADDLW 0xFF                 
    2998    BB5          3FFF                  ADDLW 0xFF                 
    2999    BB6          3FFF                  ADDLW 0xFF                 
    3000    BB7          3FFF                  ADDLW 0xFF                 
    3001    BB8          3FFF                  ADDLW 0xFF                 
    3002    BB9          3FFF                  ADDLW 0xFF                 
    3003    BBA          3FFF                  ADDLW 0xFF                 
    3004    BBB          3FFF                  ADDLW 0xFF                 
    3005    BBC          3FFF                  ADDLW 0xFF                 
    3006    BBD          3FFF                  ADDLW 0xFF                 
    3007    BBE          3FFF                  ADDLW 0xFF                 
    3008    BBF          3FFF                  ADDLW 0xFF                 
    3009    BC0          3FFF                  ADDLW 0xFF                 
    3010    BC1          3FFF                  ADDLW 0xFF                 
    3011    BC2          3FFF                  ADDLW 0xFF                 
    3012    BC3          3FFF                  ADDLW 0xFF                 
    3013    BC4          3FFF                  ADDLW 0xFF                 
    3014    BC5          3FFF                  ADDLW 0xFF                 
    3015    BC6          3FFF                  ADDLW 0xFF                 
    3016    BC7          3FFF                  ADDLW 0xFF                 
    3017    BC8          3FFF                  ADDLW 0xFF                 
    3018    BC9          3FFF                  ADDLW 0xFF                 
    3019    BCA          3FFF                  ADDLW 0xFF                 
    3020    BCB          3FFF                  ADDLW 0xFF                 
    3021    BCC          3FFF                  ADDLW 0xFF                 
    3022    BCD          3FFF                  ADDLW 0xFF                 
    3023    BCE          3FFF                  ADDLW 0xFF                 
    3024    BCF          3FFF                  ADDLW 0xFF                 
    3025    BD0          3FFF                  ADDLW 0xFF                 
    3026    BD1          3FFF                  ADDLW 0xFF                 
    3027    BD2          3FFF                  ADDLW 0xFF                 
    3028    BD3          3FFF                  ADDLW 0xFF                 
    3029    BD4          3FFF                  ADDLW 0xFF                 
    3030    BD5          3FFF                  ADDLW 0xFF                 
    3031    BD6          3FFF                  ADDLW 0xFF                 
    3032    BD7          3FFF                  ADDLW 0xFF                 
    3033    BD8          3FFF                  ADDLW 0xFF                 
    3034    BD9          3FFF                  ADDLW 0xFF                 
    3035    BDA          3FFF                  ADDLW 0xFF                 
    3036    BDB          3FFF                  ADDLW 0xFF                 
    3037    BDC          3FFF                  ADDLW 0xFF                 
    3038    BDD          3FFF                  ADDLW 0xFF                 
    3039    BDE          3FFF                  ADDLW 0xFF                 
    3040    BDF          3FFF                  ADDLW 0xFF                 
    3041    BE0          3FFF                  ADDLW 0xFF                 
    3042    BE1          3FFF                  ADDLW 0xFF                 
    3043    BE2          3FFF                  ADDLW 0xFF                 
    3044    BE3          3FFF                  ADDLW 0xFF                 
    3045    BE4          3FFF                  ADDLW 0xFF                 
    3046    BE5          3FFF                  ADDLW 0xFF                 
    3047    BE6          3FFF                  ADDLW 0xFF                 
    3048    BE7          3FFF                  ADDLW 0xFF                 
    3049    BE8          3FFF                  ADDLW 0xFF                 
    3050    BE9          3FFF                  ADDLW 0xFF                 
    3051    BEA          3FFF                  ADDLW 0xFF                 
    3052    BEB          3FFF                  ADDLW 0xFF                 
    3053    BEC          3FFF                  ADDLW 0xFF                 
    3054    BED          3FFF                  ADDLW 0xFF                 
    3055    BEE          3FFF                  ADDLW 0xFF                 
    3056    BEF          3FFF                  ADDLW 0xFF                 
    3057    BF0          3FFF                  ADDLW 0xFF                 
    3058    BF1          3FFF                  ADDLW 0xFF                 
    3059    BF2          3FFF                  ADDLW 0xFF                 
    3060    BF3          3FFF                  ADDLW 0xFF                 
    3061    BF4          3FFF                  ADDLW 0xFF                 
    3062    BF5          3FFF                  ADDLW 0xFF                 
    3063    BF6          3FFF                  ADDLW 0xFF                 
    3064    BF7          3FFF                  ADDLW 0xFF                 
    3065    BF8          3FFF                  ADDLW 0xFF                 
    3066    BF9          3FFF                  ADDLW 0xFF                 
    3067    BFA          3FFF                  ADDLW 0xFF                 
    3068    BFB          3FFF                  ADDLW 0xFF                 
    3069    BFC          3FFF                  ADDLW 0xFF                 
    3070    BFD          3FFF                  ADDLW 0xFF                 
    3071    BFE          3FFF                  ADDLW 0xFF                 
    3072    BFF          3FFF                  ADDLW 0xFF                 
    3073    C00          3FFF                  ADDLW 0xFF                 
    3074    C01          3FFF                  ADDLW 0xFF                 
    3075    C02          3FFF                  ADDLW 0xFF                 
    3076    C03          3FFF                  ADDLW 0xFF                 
    3077    C04          3FFF                  ADDLW 0xFF                 
    3078    C05          3FFF                  ADDLW 0xFF                 
    3079    C06          3FFF                  ADDLW 0xFF                 
    3080    C07          3FFF                  ADDLW 0xFF                 
    3081    C08          3FFF                  ADDLW 0xFF                 
    3082    C09          3FFF                  ADDLW 0xFF                 
    3083    C0A          3FFF                  ADDLW 0xFF                 
    3084    C0B          3FFF                  ADDLW 0xFF                 
    3085    C0C          3FFF                  ADDLW 0xFF                 
    3086    C0D          3FFF                  ADDLW 0xFF                 
    3087    C0E          3FFF                  ADDLW 0xFF                 
    3088    C0F          3FFF                  ADDLW 0xFF                 
    3089    C10          3FFF                  ADDLW 0xFF                 
    3090    C11          3FFF                  ADDLW 0xFF                 
    3091    C12          3FFF                  ADDLW 0xFF                 
    3092    C13          3FFF                  ADDLW 0xFF                 
    3093    C14          3FFF                  ADDLW 0xFF                 
    3094    C15          3FFF                  ADDLW 0xFF                 
    3095    C16          3FFF                  ADDLW 0xFF                 
    3096    C17          3FFF                  ADDLW 0xFF                 
    3097    C18          3FFF                  ADDLW 0xFF                 
    3098    C19          3FFF                  ADDLW 0xFF                 
    3099    C1A          3FFF                  ADDLW 0xFF                 
    3100    C1B          3FFF                  ADDLW 0xFF                 
    3101    C1C          3FFF                  ADDLW 0xFF                 
    3102    C1D          3FFF                  ADDLW 0xFF                 
    3103    C1E          3FFF                  ADDLW 0xFF                 
    3104    C1F          3FFF                  ADDLW 0xFF                 
    3105    C20          3FFF                  ADDLW 0xFF                 
    3106    C21          3FFF                  ADDLW 0xFF                 
    3107    C22          3FFF                  ADDLW 0xFF                 
    3108    C23          3FFF                  ADDLW 0xFF                 
    3109    C24          3FFF                  ADDLW 0xFF                 
    3110    C25          3FFF                  ADDLW 0xFF                 
    3111    C26          3FFF                  ADDLW 0xFF                 
    3112    C27          3FFF                  ADDLW 0xFF                 
    3113    C28          3FFF                  ADDLW 0xFF                 
    3114    C29          3FFF                  ADDLW 0xFF                 
    3115    C2A          3FFF                  ADDLW 0xFF                 
    3116    C2B          3FFF                  ADDLW 0xFF                 
    3117    C2C          3FFF                  ADDLW 0xFF                 
    3118    C2D          3FFF                  ADDLW 0xFF                 
    3119    C2E          3FFF                  ADDLW 0xFF                 
    3120    C2F          3FFF                  ADDLW 0xFF                 
    3121    C30          3FFF                  ADDLW 0xFF                 
    3122    C31          3FFF                  ADDLW 0xFF                 
    3123    C32          3FFF                  ADDLW 0xFF                 
    3124    C33          3FFF                  ADDLW 0xFF                 
    3125    C34          3FFF                  ADDLW 0xFF                 
    3126    C35          3FFF                  ADDLW 0xFF                 
    3127    C36          3FFF                  ADDLW 0xFF                 
    3128    C37          3FFF                  ADDLW 0xFF                 
    3129    C38          3FFF                  ADDLW 0xFF                 
    3130    C39          3FFF                  ADDLW 0xFF                 
    3131    C3A          3FFF                  ADDLW 0xFF                 
    3132    C3B          3FFF                  ADDLW 0xFF                 
    3133    C3C          3FFF                  ADDLW 0xFF                 
    3134    C3D          3FFF                  ADDLW 0xFF                 
    3135    C3E          3FFF                  ADDLW 0xFF                 
    3136    C3F          3FFF                  ADDLW 0xFF                 
    3137    C40          3FFF                  ADDLW 0xFF                 
    3138    C41          3FFF                  ADDLW 0xFF                 
    3139    C42          3FFF                  ADDLW 0xFF                 
    3140    C43          3FFF                  ADDLW 0xFF                 
    3141    C44          3FFF                  ADDLW 0xFF                 
    3142    C45          3FFF                  ADDLW 0xFF                 
    3143    C46          3FFF                  ADDLW 0xFF                 
    3144    C47          3FFF                  ADDLW 0xFF                 
    3145    C48          3FFF                  ADDLW 0xFF                 
    3146    C49          3FFF                  ADDLW 0xFF                 
    3147    C4A          3FFF                  ADDLW 0xFF                 
    3148    C4B          3FFF                  ADDLW 0xFF                 
    3149    C4C          3FFF                  ADDLW 0xFF                 
    3150    C4D          3FFF                  ADDLW 0xFF                 
    3151    C4E          3FFF                  ADDLW 0xFF                 
    3152    C4F          3FFF                  ADDLW 0xFF                 
    3153    C50          3FFF                  ADDLW 0xFF                 
    3154    C51          3FFF                  ADDLW 0xFF                 
    3155    C52          3FFF                  ADDLW 0xFF                 
    3156    C53          3FFF                  ADDLW 0xFF                 
    3157    C54          3FFF                  ADDLW 0xFF                 
    3158    C55          3FFF                  ADDLW 0xFF                 
    3159    C56          3FFF                  ADDLW 0xFF                 
    3160    C57          3FFF                  ADDLW 0xFF                 
    3161    C58          3FFF                  ADDLW 0xFF                 
    3162    C59          3FFF                  ADDLW 0xFF                 
    3163    C5A          3FFF                  ADDLW 0xFF                 
    3164    C5B          3FFF                  ADDLW 0xFF                 
    3165    C5C          3FFF                  ADDLW 0xFF                 
    3166    C5D          3FFF                  ADDLW 0xFF                 
    3167    C5E          3FFF                  ADDLW 0xFF                 
    3168    C5F          3FFF                  ADDLW 0xFF                 
    3169    C60          3FFF                  ADDLW 0xFF                 
    3170    C61          3FFF                  ADDLW 0xFF                 
    3171    C62          3FFF                  ADDLW 0xFF                 
    3172    C63          3FFF                  ADDLW 0xFF                 
    3173    C64          3FFF                  ADDLW 0xFF                 
    3174    C65          3FFF                  ADDLW 0xFF                 
    3175    C66          3FFF                  ADDLW 0xFF                 
    3176    C67          3FFF                  ADDLW 0xFF                 
    3177    C68          3FFF                  ADDLW 0xFF                 
    3178    C69          3FFF                  ADDLW 0xFF                 
    3179    C6A          3FFF                  ADDLW 0xFF                 
    3180    C6B          3FFF                  ADDLW 0xFF                 
    3181    C6C          3FFF                  ADDLW 0xFF                 
    3182    C6D          3FFF                  ADDLW 0xFF                 
    3183    C6E          3FFF                  ADDLW 0xFF                 
    3184    C6F          3FFF                  ADDLW 0xFF                 
    3185    C70          3FFF                  ADDLW 0xFF                 
    3186    C71          3FFF                  ADDLW 0xFF                 
    3187    C72          3FFF                  ADDLW 0xFF                 
    3188    C73          3FFF                  ADDLW 0xFF                 
    3189    C74          3FFF                  ADDLW 0xFF                 
    3190    C75          3FFF                  ADDLW 0xFF                 
    3191    C76          3FFF                  ADDLW 0xFF                 
    3192    C77          3FFF                  ADDLW 0xFF                 
    3193    C78          3FFF                  ADDLW 0xFF                 
    3194    C79          3FFF                  ADDLW 0xFF                 
    3195    C7A          3FFF                  ADDLW 0xFF                 
    3196    C7B          3FFF                  ADDLW 0xFF                 
    3197    C7C          3FFF                  ADDLW 0xFF                 
    3198    C7D          3FFF                  ADDLW 0xFF                 
    3199    C7E          3FFF                  ADDLW 0xFF                 
    3200    C7F          3FFF                  ADDLW 0xFF                 
    3201    C80          3FFF                  ADDLW 0xFF                 
    3202    C81          3FFF                  ADDLW 0xFF                 
    3203    C82          3FFF                  ADDLW 0xFF                 
    3204    C83          3FFF                  ADDLW 0xFF                 
    3205    C84          3FFF                  ADDLW 0xFF                 
    3206    C85          3FFF                  ADDLW 0xFF                 
    3207    C86          3FFF                  ADDLW 0xFF                 
    3208    C87          3FFF                  ADDLW 0xFF                 
    3209    C88          3FFF                  ADDLW 0xFF                 
    3210    C89          3FFF                  ADDLW 0xFF                 
    3211    C8A          3FFF                  ADDLW 0xFF                 
    3212    C8B          3FFF                  ADDLW 0xFF                 
    3213    C8C          3FFF                  ADDLW 0xFF                 
    3214    C8D          3FFF                  ADDLW 0xFF                 
    3215    C8E          3FFF                  ADDLW 0xFF                 
    3216    C8F          3FFF                  ADDLW 0xFF                 
    3217    C90          3FFF                  ADDLW 0xFF                 
    3218    C91          3FFF                  ADDLW 0xFF                 
    3219    C92          3FFF                  ADDLW 0xFF                 
    3220    C93          3FFF                  ADDLW 0xFF                 
    3221    C94          3FFF                  ADDLW 0xFF                 
    3222    C95          3FFF                  ADDLW 0xFF                 
    3223    C96          3FFF                  ADDLW 0xFF                 
    3224    C97          3FFF                  ADDLW 0xFF                 
    3225    C98          3FFF                  ADDLW 0xFF                 
    3226    C99          3FFF                  ADDLW 0xFF                 
    3227    C9A          3FFF                  ADDLW 0xFF                 
    3228    C9B          3FFF                  ADDLW 0xFF                 
    3229    C9C          3FFF                  ADDLW 0xFF                 
    3230    C9D          3FFF                  ADDLW 0xFF                 
    3231    C9E          3FFF                  ADDLW 0xFF                 
    3232    C9F          3FFF                  ADDLW 0xFF                 
    3233    CA0          3FFF                  ADDLW 0xFF                 
    3234    CA1          3FFF                  ADDLW 0xFF                 
    3235    CA2          3FFF                  ADDLW 0xFF                 
    3236    CA3          3FFF                  ADDLW 0xFF                 
    3237    CA4          3FFF                  ADDLW 0xFF                 
    3238    CA5          3FFF                  ADDLW 0xFF                 
    3239    CA6          3FFF                  ADDLW 0xFF                 
    3240    CA7          3FFF                  ADDLW 0xFF                 
    3241    CA8          3FFF                  ADDLW 0xFF                 
    3242    CA9          3FFF                  ADDLW 0xFF                 
    3243    CAA          3FFF                  ADDLW 0xFF                 
    3244    CAB          3FFF                  ADDLW 0xFF                 
    3245    CAC          3FFF                  ADDLW 0xFF                 
    3246    CAD          3FFF                  ADDLW 0xFF                 
    3247    CAE          3FFF                  ADDLW 0xFF                 
    3248    CAF          3FFF                  ADDLW 0xFF                 
    3249    CB0          3FFF                  ADDLW 0xFF                 
    3250    CB1          3FFF                  ADDLW 0xFF                 
    3251    CB2          3FFF                  ADDLW 0xFF                 
    3252    CB3          3FFF                  ADDLW 0xFF                 
    3253    CB4          3FFF                  ADDLW 0xFF                 
    3254    CB5          3FFF                  ADDLW 0xFF                 
    3255    CB6          3FFF                  ADDLW 0xFF                 
    3256    CB7          3FFF                  ADDLW 0xFF                 
    3257    CB8          3FFF                  ADDLW 0xFF                 
    3258    CB9          3FFF                  ADDLW 0xFF                 
    3259    CBA          3FFF                  ADDLW 0xFF                 
    3260    CBB          3FFF                  ADDLW 0xFF                 
    3261    CBC          3FFF                  ADDLW 0xFF                 
    3262    CBD          3FFF                  ADDLW 0xFF                 
    3263    CBE          3FFF                  ADDLW 0xFF                 
    3264    CBF          3FFF                  ADDLW 0xFF                 
    3265    CC0          3FFF                  ADDLW 0xFF                 
    3266    CC1          3FFF                  ADDLW 0xFF                 
    3267    CC2          3FFF                  ADDLW 0xFF                 
    3268    CC3          3FFF                  ADDLW 0xFF                 
    3269    CC4          3FFF                  ADDLW 0xFF                 
    3270    CC5          3FFF                  ADDLW 0xFF                 
    3271    CC6          3FFF                  ADDLW 0xFF                 
    3272    CC7          3FFF                  ADDLW 0xFF                 
    3273    CC8          3FFF                  ADDLW 0xFF                 
    3274    CC9          3FFF                  ADDLW 0xFF                 
    3275    CCA          3FFF                  ADDLW 0xFF                 
    3276    CCB          3FFF                  ADDLW 0xFF                 
    3277    CCC          3FFF                  ADDLW 0xFF                 
    3278    CCD          3FFF                  ADDLW 0xFF                 
    3279    CCE          3FFF                  ADDLW 0xFF                 
    3280    CCF          3FFF                  ADDLW 0xFF                 
    3281    CD0          3FFF                  ADDLW 0xFF                 
    3282    CD1          3FFF                  ADDLW 0xFF                 
    3283    CD2          3FFF                  ADDLW 0xFF                 
    3284    CD3          3FFF                  ADDLW 0xFF                 
    3285    CD4          3FFF                  ADDLW 0xFF                 
    3286    CD5          3FFF                  ADDLW 0xFF                 
    3287    CD6          3FFF                  ADDLW 0xFF                 
    3288    CD7          3FFF                  ADDLW 0xFF                 
    3289    CD8          3FFF                  ADDLW 0xFF                 
    3290    CD9          3FFF                  ADDLW 0xFF                 
    3291    CDA          3FFF                  ADDLW 0xFF                 
    3292    CDB          3FFF                  ADDLW 0xFF                 
    3293    CDC          3FFF                  ADDLW 0xFF                 
    3294    CDD          3FFF                  ADDLW 0xFF                 
    3295    CDE          3FFF                  ADDLW 0xFF                 
    3296    CDF          3FFF                  ADDLW 0xFF                 
    3297    CE0          3FFF                  ADDLW 0xFF                 
    3298    CE1          3FFF                  ADDLW 0xFF                 
    3299    CE2          3FFF                  ADDLW 0xFF                 
    3300    CE3          3FFF                  ADDLW 0xFF                 
    3301    CE4          3FFF                  ADDLW 0xFF                 
    3302    CE5          3FFF                  ADDLW 0xFF                 
    3303    CE6          3FFF                  ADDLW 0xFF                 
    3304    CE7          3FFF                  ADDLW 0xFF                 
    3305    CE8          3FFF                  ADDLW 0xFF                 
    3306    CE9          3FFF                  ADDLW 0xFF                 
    3307    CEA          3FFF                  ADDLW 0xFF                 
    3308    CEB          3FFF                  ADDLW 0xFF                 
    3309    CEC          3FFF                  ADDLW 0xFF                 
    3310    CED          3FFF                  ADDLW 0xFF                 
    3311    CEE          3FFF                  ADDLW 0xFF                 
    3312    CEF          3FFF                  ADDLW 0xFF                 
    3313    CF0          3FFF                  ADDLW 0xFF                 
    3314    CF1          3FFF                  ADDLW 0xFF                 
    3315    CF2          3FFF                  ADDLW 0xFF                 
    3316    CF3          3FFF                  ADDLW 0xFF                 
    3317    CF4          3FFF                  ADDLW 0xFF                 
    3318    CF5          3FFF                  ADDLW 0xFF                 
    3319    CF6          3FFF                  ADDLW 0xFF                 
    3320    CF7          3FFF                  ADDLW 0xFF                 
    3321    CF8          3FFF                  ADDLW 0xFF                 
    3322    CF9          3FFF                  ADDLW 0xFF                 
    3323    CFA          3FFF                  ADDLW 0xFF                 
    3324    CFB          3FFF                  ADDLW 0xFF                 
    3325    CFC          3FFF                  ADDLW 0xFF                 
    3326    CFD          3FFF                  ADDLW 0xFF                 
    3327    CFE          3FFF                  ADDLW 0xFF                 
    3328    CFF          3FFF                  ADDLW 0xFF                 
    3329    D00          3FFF                  ADDLW 0xFF                 
    3330    D01          3FFF                  ADDLW 0xFF                 
    3331    D02          3FFF                  ADDLW 0xFF                 
    3332    D03          3FFF                  ADDLW 0xFF                 
    3333    D04          3FFF                  ADDLW 0xFF                 
    3334    D05          3FFF                  ADDLW 0xFF                 
    3335    D06          3FFF                  ADDLW 0xFF                 
    3336    D07          3FFF                  ADDLW 0xFF                 
    3337    D08          3FFF                  ADDLW 0xFF                 
    3338    D09          3FFF                  ADDLW 0xFF                 
    3339    D0A          3FFF                  ADDLW 0xFF                 
    3340    D0B          3FFF                  ADDLW 0xFF                 
    3341    D0C          3FFF                  ADDLW 0xFF                 
    3342    D0D          3FFF                  ADDLW 0xFF                 
    3343    D0E          3FFF                  ADDLW 0xFF                 
    3344    D0F          3FFF                  ADDLW 0xFF                 
    3345    D10          3FFF                  ADDLW 0xFF                 
    3346    D11          3FFF                  ADDLW 0xFF                 
    3347    D12          3FFF                  ADDLW 0xFF                 
    3348    D13          3FFF                  ADDLW 0xFF                 
    3349    D14          3FFF                  ADDLW 0xFF                 
    3350    D15          3FFF                  ADDLW 0xFF                 
    3351    D16          3FFF                  ADDLW 0xFF                 
    3352    D17          3FFF                  ADDLW 0xFF                 
    3353    D18          3FFF                  ADDLW 0xFF                 
    3354    D19          3FFF                  ADDLW 0xFF                 
    3355    D1A          3FFF                  ADDLW 0xFF                 
    3356    D1B          3FFF                  ADDLW 0xFF                 
    3357    D1C          3FFF                  ADDLW 0xFF                 
    3358    D1D          3FFF                  ADDLW 0xFF                 
    3359    D1E          3FFF                  ADDLW 0xFF                 
    3360    D1F          3FFF                  ADDLW 0xFF                 
    3361    D20          3FFF                  ADDLW 0xFF                 
    3362    D21          3FFF                  ADDLW 0xFF                 
    3363    D22          3FFF                  ADDLW 0xFF                 
    3364    D23          3FFF                  ADDLW 0xFF                 
    3365    D24          3FFF                  ADDLW 0xFF                 
    3366    D25          3FFF                  ADDLW 0xFF                 
    3367    D26          3FFF                  ADDLW 0xFF                 
    3368    D27          3FFF                  ADDLW 0xFF                 
    3369    D28          3FFF                  ADDLW 0xFF                 
    3370    D29          3FFF                  ADDLW 0xFF                 
    3371    D2A          3FFF                  ADDLW 0xFF                 
    3372    D2B          3FFF                  ADDLW 0xFF                 
    3373    D2C          3FFF                  ADDLW 0xFF                 
    3374    D2D          3FFF                  ADDLW 0xFF                 
    3375    D2E          3FFF                  ADDLW 0xFF                 
    3376    D2F          3FFF                  ADDLW 0xFF                 
    3377    D30          3FFF                  ADDLW 0xFF                 
    3378    D31          3FFF                  ADDLW 0xFF                 
    3379    D32          3FFF                  ADDLW 0xFF                 
    3380    D33          3FFF                  ADDLW 0xFF                 
    3381    D34          3FFF                  ADDLW 0xFF                 
    3382    D35          3FFF                  ADDLW 0xFF                 
    3383    D36          3FFF                  ADDLW 0xFF                 
    3384    D37          3FFF                  ADDLW 0xFF                 
    3385    D38          3FFF                  ADDLW 0xFF                 
    3386    D39          3FFF                  ADDLW 0xFF                 
    3387    D3A          3FFF                  ADDLW 0xFF                 
    3388    D3B          3FFF                  ADDLW 0xFF                 
    3389    D3C          3FFF                  ADDLW 0xFF                 
    3390    D3D          3FFF                  ADDLW 0xFF                 
    3391    D3E          3FFF                  ADDLW 0xFF                 
    3392    D3F          3FFF                  ADDLW 0xFF                 
    3393    D40          3FFF                  ADDLW 0xFF                 
    3394    D41          3FFF                  ADDLW 0xFF                 
    3395    D42          3FFF                  ADDLW 0xFF                 
    3396    D43          3FFF                  ADDLW 0xFF                 
    3397    D44          3FFF                  ADDLW 0xFF                 
    3398    D45          3FFF                  ADDLW 0xFF                 
    3399    D46          3FFF                  ADDLW 0xFF                 
    3400    D47          3FFF                  ADDLW 0xFF                 
    3401    D48          3FFF                  ADDLW 0xFF                 
    3402    D49          3FFF                  ADDLW 0xFF                 
    3403    D4A          3FFF                  ADDLW 0xFF                 
    3404    D4B          3FFF                  ADDLW 0xFF                 
    3405    D4C          3FFF                  ADDLW 0xFF                 
    3406    D4D          3FFF                  ADDLW 0xFF                 
    3407    D4E          3FFF                  ADDLW 0xFF                 
    3408    D4F          3FFF                  ADDLW 0xFF                 
    3409    D50          3FFF                  ADDLW 0xFF                 
    3410    D51          3FFF                  ADDLW 0xFF                 
    3411    D52          3FFF                  ADDLW 0xFF                 
    3412    D53          3FFF                  ADDLW 0xFF                 
    3413    D54          3FFF                  ADDLW 0xFF                 
    3414    D55          3FFF                  ADDLW 0xFF                 
    3415    D56          3FFF                  ADDLW 0xFF                 
    3416    D57          3FFF                  ADDLW 0xFF                 
    3417    D58          3FFF                  ADDLW 0xFF                 
    3418    D59          3FFF                  ADDLW 0xFF                 
    3419    D5A          3FFF                  ADDLW 0xFF                 
    3420    D5B          3FFF                  ADDLW 0xFF                 
    3421    D5C          3FFF                  ADDLW 0xFF                 
    3422    D5D          3FFF                  ADDLW 0xFF                 
    3423    D5E          3FFF                  ADDLW 0xFF                 
    3424    D5F          3FFF                  ADDLW 0xFF                 
    3425    D60          3FFF                  ADDLW 0xFF                 
    3426    D61          3FFF                  ADDLW 0xFF                 
    3427    D62          3FFF                  ADDLW 0xFF                 
    3428    D63          3FFF                  ADDLW 0xFF                 
    3429    D64          3FFF                  ADDLW 0xFF                 
    3430    D65          3FFF                  ADDLW 0xFF                 
    3431    D66          3FFF                  ADDLW 0xFF                 
    3432    D67          3FFF                  ADDLW 0xFF                 
    3433    D68          3FFF                  ADDLW 0xFF                 
    3434    D69          3FFF                  ADDLW 0xFF                 
    3435    D6A          3FFF                  ADDLW 0xFF                 
    3436    D6B          3FFF                  ADDLW 0xFF                 
    3437    D6C          3FFF                  ADDLW 0xFF                 
    3438    D6D          3FFF                  ADDLW 0xFF                 
    3439    D6E          3FFF                  ADDLW 0xFF                 
    3440    D6F          3FFF                  ADDLW 0xFF                 
    3441    D70          3FFF                  ADDLW 0xFF                 
    3442    D71          3FFF                  ADDLW 0xFF                 
    3443    D72          3FFF                  ADDLW 0xFF                 
    3444    D73          3FFF                  ADDLW 0xFF                 
    3445    D74          3FFF                  ADDLW 0xFF                 
    3446    D75          3FFF                  ADDLW 0xFF                 
    3447    D76          3FFF                  ADDLW 0xFF                 
    3448    D77          3FFF                  ADDLW 0xFF                 
    3449    D78          3FFF                  ADDLW 0xFF                 
    3450    D79          3FFF                  ADDLW 0xFF                 
    3451    D7A          3FFF                  ADDLW 0xFF                 
    3452    D7B          3FFF                  ADDLW 0xFF                 
    3453    D7C          3FFF                  ADDLW 0xFF                 
    3454    D7D          3FFF                  ADDLW 0xFF                 
    3455    D7E          3FFF                  ADDLW 0xFF                 
    3456    D7F          3FFF                  ADDLW 0xFF                 
    3457    D80          3FFF                  ADDLW 0xFF                 
    3458    D81          3FFF                  ADDLW 0xFF                 
    3459    D82          3FFF                  ADDLW 0xFF                 
    3460    D83          3FFF                  ADDLW 0xFF                 
    3461    D84          3FFF                  ADDLW 0xFF                 
    3462    D85          3FFF                  ADDLW 0xFF                 
    3463    D86          3FFF                  ADDLW 0xFF                 
    3464    D87          3FFF                  ADDLW 0xFF                 
    3465    D88          3FFF                  ADDLW 0xFF                 
    3466    D89          3FFF                  ADDLW 0xFF                 
    3467    D8A          3FFF                  ADDLW 0xFF                 
    3468    D8B          3FFF                  ADDLW 0xFF                 
    3469    D8C          3FFF                  ADDLW 0xFF                 
    3470    D8D          3FFF                  ADDLW 0xFF                 
    3471    D8E          3FFF                  ADDLW 0xFF                 
    3472    D8F          3FFF                  ADDLW 0xFF                 
    3473    D90          3FFF                  ADDLW 0xFF                 
    3474    D91          3FFF                  ADDLW 0xFF                 
    3475    D92          3FFF                  ADDLW 0xFF                 
    3476    D93          3FFF                  ADDLW 0xFF                 
    3477    D94          3FFF                  ADDLW 0xFF                 
    3478    D95          3FFF                  ADDLW 0xFF                 
    3479    D96          3FFF                  ADDLW 0xFF                 
    3480    D97          3FFF                  ADDLW 0xFF                 
    3481    D98          3FFF                  ADDLW 0xFF                 
    3482    D99          3FFF                  ADDLW 0xFF                 
    3483    D9A          3FFF                  ADDLW 0xFF                 
    3484    D9B          3FFF                  ADDLW 0xFF                 
    3485    D9C          3FFF                  ADDLW 0xFF                 
    3486    D9D          3FFF                  ADDLW 0xFF                 
    3487    D9E          3FFF                  ADDLW 0xFF                 
    3488    D9F          3FFF                  ADDLW 0xFF                 
    3489    DA0          3FFF                  ADDLW 0xFF                 
    3490    DA1          3FFF                  ADDLW 0xFF                 
    3491    DA2          3FFF                  ADDLW 0xFF                 
    3492    DA3          3FFF                  ADDLW 0xFF                 
    3493    DA4          3FFF                  ADDLW 0xFF                 
    3494    DA5          3FFF                  ADDLW 0xFF                 
    3495    DA6          3FFF                  ADDLW 0xFF                 
    3496    DA7          3FFF                  ADDLW 0xFF                 
    3497    DA8          3FFF                  ADDLW 0xFF                 
    3498    DA9          3FFF                  ADDLW 0xFF                 
    3499    DAA          3FFF                  ADDLW 0xFF                 
    3500    DAB          3FFF                  ADDLW 0xFF                 
    3501    DAC          3FFF                  ADDLW 0xFF                 
    3502    DAD          3FFF                  ADDLW 0xFF                 
    3503    DAE          3FFF                  ADDLW 0xFF                 
    3504    DAF          3FFF                  ADDLW 0xFF                 
    3505    DB0          3FFF                  ADDLW 0xFF                 
    3506    DB1          3FFF                  ADDLW 0xFF                 
    3507    DB2          3FFF                  ADDLW 0xFF                 
    3508    DB3          3FFF                  ADDLW 0xFF                 
    3509    DB4          3FFF                  ADDLW 0xFF                 
    3510    DB5          3FFF                  ADDLW 0xFF                 
    3511    DB6          3FFF                  ADDLW 0xFF                 
    3512    DB7          3FFF                  ADDLW 0xFF                 
    3513    DB8          3FFF                  ADDLW 0xFF                 
    3514    DB9          3FFF                  ADDLW 0xFF                 
    3515    DBA          3FFF                  ADDLW 0xFF                 
    3516    DBB          3FFF                  ADDLW 0xFF                 
    3517    DBC          3FFF                  ADDLW 0xFF                 
    3518    DBD          3FFF                  ADDLW 0xFF                 
    3519    DBE          3FFF                  ADDLW 0xFF                 
    3520    DBF          3FFF                  ADDLW 0xFF                 
    3521    DC0          3FFF                  ADDLW 0xFF                 
    3522    DC1          3FFF                  ADDLW 0xFF                 
    3523    DC2          3FFF                  ADDLW 0xFF                 
    3524    DC3          3FFF                  ADDLW 0xFF                 
    3525    DC4          3FFF                  ADDLW 0xFF                 
    3526    DC5          3FFF                  ADDLW 0xFF                 
    3527    DC6          3FFF                  ADDLW 0xFF                 
    3528    DC7          3FFF                  ADDLW 0xFF                 
    3529    DC8          3FFF                  ADDLW 0xFF                 
    3530    DC9          3FFF                  ADDLW 0xFF                 
    3531    DCA          3FFF                  ADDLW 0xFF                 
    3532    DCB          3FFF                  ADDLW 0xFF                 
    3533    DCC          3FFF                  ADDLW 0xFF                 
    3534    DCD          3FFF                  ADDLW 0xFF                 
    3535    DCE          3FFF                  ADDLW 0xFF                 
    3536    DCF          3FFF                  ADDLW 0xFF                 
    3537    DD0          3FFF                  ADDLW 0xFF                 
    3538    DD1          3FFF                  ADDLW 0xFF                 
    3539    DD2          3FFF                  ADDLW 0xFF                 
    3540    DD3          3FFF                  ADDLW 0xFF                 
    3541    DD4          3FFF                  ADDLW 0xFF                 
    3542    DD5          3FFF                  ADDLW 0xFF                 
    3543    DD6          3FFF                  ADDLW 0xFF                 
    3544    DD7          3FFF                  ADDLW 0xFF                 
    3545    DD8          3FFF                  ADDLW 0xFF                 
    3546    DD9          3FFF                  ADDLW 0xFF                 
    3547    DDA          3FFF                  ADDLW 0xFF                 
    3548    DDB          3FFF                  ADDLW 0xFF                 
    3549    DDC          3FFF                  ADDLW 0xFF                 
    3550    DDD          3FFF                  ADDLW 0xFF                 
    3551    DDE          3FFF                  ADDLW 0xFF                 
    3552    DDF          3FFF                  ADDLW 0xFF                 
    3553    DE0          3FFF                  ADDLW 0xFF                 
    3554    DE1          3FFF                  ADDLW 0xFF                 
    3555    DE2          3FFF                  ADDLW 0xFF                 
    3556    DE3          3FFF                  ADDLW 0xFF                 
    3557    DE4          3FFF                  ADDLW 0xFF                 
    3558    DE5          3FFF                  ADDLW 0xFF                 
    3559    DE6          3FFF                  ADDLW 0xFF                 
    3560    DE7          3FFF                  ADDLW 0xFF                 
    3561    DE8          3FFF                  ADDLW 0xFF                 
    3562    DE9          3FFF                  ADDLW 0xFF                 
    3563    DEA          3FFF                  ADDLW 0xFF                 
    3564    DEB          3FFF                  ADDLW 0xFF                 
    3565    DEC          3FFF                  ADDLW 0xFF                 
    3566    DED          3FFF                  ADDLW 0xFF                 
    3567    DEE          3FFF                  ADDLW 0xFF                 
    3568    DEF          3FFF                  ADDLW 0xFF                 
    3569    DF0          3FFF                  ADDLW 0xFF                 
    3570    DF1          3FFF                  ADDLW 0xFF                 
    3571    DF2          3FFF                  ADDLW 0xFF                 
    3572    DF3          3FFF                  ADDLW 0xFF                 
    3573    DF4          3FFF                  ADDLW 0xFF                 
    3574    DF5          3FFF                  ADDLW 0xFF                 
    3575    DF6          3FFF                  ADDLW 0xFF                 
    3576    DF7          3FFF                  ADDLW 0xFF                 
    3577    DF8          3FFF                  ADDLW 0xFF                 
    3578    DF9          3FFF                  ADDLW 0xFF                 
    3579    DFA          3FFF                  ADDLW 0xFF                 
    3580    DFB          3FFF                  ADDLW 0xFF                 
    3581    DFC          3FFF                  ADDLW 0xFF                 
    3582    DFD          3FFF                  ADDLW 0xFF                 
    3583    DFE          3FFF                  ADDLW 0xFF                 
    3584    DFF          3FFF                  ADDLW 0xFF                 
    3585    E00          3FFF                  ADDLW 0xFF                 
    3586    E01          3FFF                  ADDLW 0xFF                 
    3587    E02          3FFF                  ADDLW 0xFF                 
    3588    E03          3FFF                  ADDLW 0xFF                 
    3589    E04          3FFF                  ADDLW 0xFF                 
    3590    E05          3FFF                  ADDLW 0xFF                 
    3591    E06          3FFF                  ADDLW 0xFF                 
    3592    E07          3FFF                  ADDLW 0xFF                 
    3593    E08          3FFF                  ADDLW 0xFF                 
    3594    E09          3FFF                  ADDLW 0xFF                 
    3595    E0A          3FFF                  ADDLW 0xFF                 
    3596    E0B          3FFF                  ADDLW 0xFF                 
    3597    E0C          3FFF                  ADDLW 0xFF                 
    3598    E0D          3FFF                  ADDLW 0xFF                 
    3599    E0E          3FFF                  ADDLW 0xFF                 
    3600    E0F          3FFF                  ADDLW 0xFF                 
    3601    E10          3FFF                  ADDLW 0xFF                 
    3602    E11          3FFF                  ADDLW 0xFF                 
    3603    E12          3FFF                  ADDLW 0xFF                 
    3604    E13          3FFF                  ADDLW 0xFF                 
    3605    E14          3FFF                  ADDLW 0xFF                 
    3606    E15          3FFF                  ADDLW 0xFF                 
    3607    E16          3FFF                  ADDLW 0xFF                 
    3608    E17          3FFF                  ADDLW 0xFF                 
    3609    E18          3FFF                  ADDLW 0xFF                 
    3610    E19          3FFF                  ADDLW 0xFF                 
    3611    E1A          3FFF                  ADDLW 0xFF                 
    3612    E1B          3FFF                  ADDLW 0xFF                 
    3613    E1C          3FFF                  ADDLW 0xFF                 
    3614    E1D          3FFF                  ADDLW 0xFF                 
    3615    E1E          3FFF                  ADDLW 0xFF                 
    3616    E1F          3FFF                  ADDLW 0xFF                 
    3617    E20          3FFF                  ADDLW 0xFF                 
    3618    E21          3FFF                  ADDLW 0xFF                 
    3619    E22          3FFF                  ADDLW 0xFF                 
    3620    E23          3FFF                  ADDLW 0xFF                 
    3621    E24          3FFF                  ADDLW 0xFF                 
    3622    E25          3FFF                  ADDLW 0xFF                 
    3623    E26          3FFF                  ADDLW 0xFF                 
    3624    E27          3FFF                  ADDLW 0xFF                 
    3625    E28          3FFF                  ADDLW 0xFF                 
    3626    E29          3FFF                  ADDLW 0xFF                 
    3627    E2A          3FFF                  ADDLW 0xFF                 
    3628    E2B          3FFF                  ADDLW 0xFF                 
    3629    E2C          3FFF                  ADDLW 0xFF                 
    3630    E2D          3FFF                  ADDLW 0xFF                 
    3631    E2E          3FFF                  ADDLW 0xFF                 
    3632    E2F          3FFF                  ADDLW 0xFF                 
    3633    E30          3FFF                  ADDLW 0xFF                 
    3634    E31          3FFF                  ADDLW 0xFF                 
    3635    E32          3FFF                  ADDLW 0xFF                 
    3636    E33          3FFF                  ADDLW 0xFF                 
    3637    E34          3FFF                  ADDLW 0xFF                 
    3638    E35          3FFF                  ADDLW 0xFF                 
    3639    E36          3FFF                  ADDLW 0xFF                 
    3640    E37          3FFF                  ADDLW 0xFF                 
    3641    E38          3FFF                  ADDLW 0xFF                 
    3642    E39          3FFF                  ADDLW 0xFF                 
    3643    E3A          3FFF                  ADDLW 0xFF                 
    3644    E3B          3FFF                  ADDLW 0xFF                 
    3645    E3C          3FFF                  ADDLW 0xFF                 
    3646    E3D          3FFF                  ADDLW 0xFF                 
    3647    E3E          3FFF                  ADDLW 0xFF                 
    3648    E3F          3FFF                  ADDLW 0xFF                 
    3649    E40          3FFF                  ADDLW 0xFF                 
    3650    E41          3FFF                  ADDLW 0xFF                 
    3651    E42          3FFF                  ADDLW 0xFF                 
    3652    E43          3FFF                  ADDLW 0xFF                 
    3653    E44          3FFF                  ADDLW 0xFF                 
    3654    E45          3FFF                  ADDLW 0xFF                 
    3655    E46          3FFF                  ADDLW 0xFF                 
    3656    E47          3FFF                  ADDLW 0xFF                 
    3657    E48          3FFF                  ADDLW 0xFF                 
    3658    E49          3FFF                  ADDLW 0xFF                 
    3659    E4A          3FFF                  ADDLW 0xFF                 
    3660    E4B          3FFF                  ADDLW 0xFF                 
    3661    E4C          3FFF                  ADDLW 0xFF                 
    3662    E4D          3FFF                  ADDLW 0xFF                 
    3663    E4E          3FFF                  ADDLW 0xFF                 
    3664    E4F          3FFF                  ADDLW 0xFF                 
    3665    E50          3FFF                  ADDLW 0xFF                 
    3666    E51          3FFF                  ADDLW 0xFF                 
    3667    E52          3FFF                  ADDLW 0xFF                 
    3668    E53          3FFF                  ADDLW 0xFF                 
    3669    E54          3FFF                  ADDLW 0xFF                 
    3670    E55          3FFF                  ADDLW 0xFF                 
    3671    E56          3FFF                  ADDLW 0xFF                 
    3672    E57          3FFF                  ADDLW 0xFF                 
    3673    E58          3FFF                  ADDLW 0xFF                 
    3674    E59          3FFF                  ADDLW 0xFF                 
    3675    E5A          3FFF                  ADDLW 0xFF                 
    3676    E5B          3FFF                  ADDLW 0xFF                 
    3677    E5C          3FFF                  ADDLW 0xFF                 
    3678    E5D          3FFF                  ADDLW 0xFF                 
    3679    E5E          3FFF                  ADDLW 0xFF                 
    3680    E5F          3FFF                  ADDLW 0xFF                 
    3681    E60          3FFF                  ADDLW 0xFF                 
    3682    E61          3FFF                  ADDLW 0xFF                 
    3683    E62          3FFF                  ADDLW 0xFF                 
    3684    E63          3FFF                  ADDLW 0xFF                 
    3685    E64          3FFF                  ADDLW 0xFF                 
    3686    E65          3FFF                  ADDLW 0xFF                 
    3687    E66          3FFF                  ADDLW 0xFF                 
    3688    E67          3FFF                  ADDLW 0xFF                 
    3689    E68          3FFF                  ADDLW 0xFF                 
    3690    E69          3FFF                  ADDLW 0xFF                 
    3691    E6A          3FFF                  ADDLW 0xFF                 
    3692    E6B          3FFF                  ADDLW 0xFF                 
    3693    E6C          3FFF                  ADDLW 0xFF                 
    3694    E6D          3FFF                  ADDLW 0xFF                 
    3695    E6E          3FFF                  ADDLW 0xFF                 
    3696    E6F          3FFF                  ADDLW 0xFF                 
    3697    E70          3FFF                  ADDLW 0xFF                 
    3698    E71          3FFF                  ADDLW 0xFF                 
    3699    E72          3FFF                  ADDLW 0xFF                 
    3700    E73          3FFF                  ADDLW 0xFF                 
    3701    E74          3FFF                  ADDLW 0xFF                 
    3702    E75          3FFF                  ADDLW 0xFF                 
    3703    E76          3FFF                  ADDLW 0xFF                 
    3704    E77          3FFF                  ADDLW 0xFF                 
    3705    E78          3FFF                  ADDLW 0xFF                 
    3706    E79          3FFF                  ADDLW 0xFF                 
    3707    E7A          3FFF                  ADDLW 0xFF                 
    3708    E7B          3FFF                  ADDLW 0xFF                 
    3709    E7C          3FFF                  ADDLW 0xFF                 
    3710    E7D          3FFF                  ADDLW 0xFF                 
    3711    E7E          3FFF                  ADDLW 0xFF                 
    3712    E7F          3FFF                  ADDLW 0xFF                 
    3713    E80          3FFF                  ADDLW 0xFF                 
    3714    E81          3FFF                  ADDLW 0xFF                 
    3715    E82          3FFF                  ADDLW 0xFF                 
    3716    E83          3FFF                  ADDLW 0xFF                 
    3717    E84          3FFF                  ADDLW 0xFF                 
    3718    E85          3FFF                  ADDLW 0xFF                 
    3719    E86          3FFF                  ADDLW 0xFF                 
    3720    E87          3FFF                  ADDLW 0xFF                 
    3721    E88          3FFF                  ADDLW 0xFF                 
    3722    E89          3FFF                  ADDLW 0xFF                 
    3723    E8A          3FFF                  ADDLW 0xFF                 
    3724    E8B          3FFF                  ADDLW 0xFF                 
    3725    E8C          3FFF                  ADDLW 0xFF                 
    3726    E8D          3FFF                  ADDLW 0xFF                 
    3727    E8E          3FFF                  ADDLW 0xFF                 
    3728    E8F          3FFF                  ADDLW 0xFF                 
    3729    E90          3FFF                  ADDLW 0xFF                 
    3730    E91          3FFF                  ADDLW 0xFF                 
    3731    E92          3FFF                  ADDLW 0xFF                 
    3732    E93          3FFF                  ADDLW 0xFF                 
    3733    E94          3FFF                  ADDLW 0xFF                 
    3734    E95          3FFF                  ADDLW 0xFF                 
    3735    E96          3FFF                  ADDLW 0xFF                 
    3736    E97          3FFF                  ADDLW 0xFF                 
    3737    E98          3FFF                  ADDLW 0xFF                 
    3738    E99          3FFF                  ADDLW 0xFF                 
    3739    E9A          3FFF                  ADDLW 0xFF                 
    3740    E9B          3FFF                  ADDLW 0xFF                 
    3741    E9C          3FFF                  ADDLW 0xFF                 
    3742    E9D          3FFF                  ADDLW 0xFF                 
    3743    E9E          3FFF                  ADDLW 0xFF                 
    3744    E9F          3FFF                  ADDLW 0xFF                 
    3745    EA0          3FFF                  ADDLW 0xFF                 
    3746    EA1          3FFF                  ADDLW 0xFF                 
    3747    EA2          3FFF                  ADDLW 0xFF                 
    3748    EA3          3FFF                  ADDLW 0xFF                 
    3749    EA4          3FFF                  ADDLW 0xFF                 
    3750    EA5          3FFF                  ADDLW 0xFF                 
    3751    EA6          3FFF                  ADDLW 0xFF                 
    3752    EA7          3FFF                  ADDLW 0xFF                 
    3753    EA8          3FFF                  ADDLW 0xFF                 
    3754    EA9          3FFF                  ADDLW 0xFF                 
    3755    EAA          3FFF                  ADDLW 0xFF                 
    3756    EAB          3FFF                  ADDLW 0xFF                 
    3757    EAC          3FFF                  ADDLW 0xFF                 
    3758    EAD          3FFF                  ADDLW 0xFF                 
    3759    EAE          3FFF                  ADDLW 0xFF                 
    3760    EAF          3FFF                  ADDLW 0xFF                 
    3761    EB0          3FFF                  ADDLW 0xFF                 
    3762    EB1          3FFF                  ADDLW 0xFF                 
    3763    EB2          3FFF                  ADDLW 0xFF                 
    3764    EB3          3FFF                  ADDLW 0xFF                 
    3765    EB4          3FFF                  ADDLW 0xFF                 
    3766    EB5          3FFF                  ADDLW 0xFF                 
    3767    EB6          3FFF                  ADDLW 0xFF                 
    3768    EB7          3FFF                  ADDLW 0xFF                 
    3769    EB8          3FFF                  ADDLW 0xFF                 
    3770    EB9          3FFF                  ADDLW 0xFF                 
    3771    EBA          3FFF                  ADDLW 0xFF                 
    3772    EBB          3FFF                  ADDLW 0xFF                 
    3773    EBC          3FFF                  ADDLW 0xFF                 
    3774    EBD          3FFF                  ADDLW 0xFF                 
    3775    EBE          3FFF                  ADDLW 0xFF                 
    3776    EBF          3FFF                  ADDLW 0xFF                 
    3777    EC0          3FFF                  ADDLW 0xFF                 
    3778    EC1          3FFF                  ADDLW 0xFF                 
    3779    EC2          3FFF                  ADDLW 0xFF                 
    3780    EC3          3FFF                  ADDLW 0xFF                 
    3781    EC4          3FFF                  ADDLW 0xFF                 
    3782    EC5          3FFF                  ADDLW 0xFF                 
    3783    EC6          3FFF                  ADDLW 0xFF                 
    3784    EC7          3FFF                  ADDLW 0xFF                 
    3785    EC8          3FFF                  ADDLW 0xFF                 
    3786    EC9          3FFF                  ADDLW 0xFF                 
    3787    ECA          3FFF                  ADDLW 0xFF                 
    3788    ECB          3FFF                  ADDLW 0xFF                 
    3789    ECC          3FFF                  ADDLW 0xFF                 
    3790    ECD          3FFF                  ADDLW 0xFF                 
    3791    ECE          3FFF                  ADDLW 0xFF                 
    3792    ECF          3FFF                  ADDLW 0xFF                 
    3793    ED0          3FFF                  ADDLW 0xFF                 
    3794    ED1          3FFF                  ADDLW 0xFF                 
    3795    ED2          3FFF                  ADDLW 0xFF                 
    3796    ED3          3FFF                  ADDLW 0xFF                 
    3797    ED4          3FFF                  ADDLW 0xFF                 
    3798    ED5          3FFF                  ADDLW 0xFF                 
    3799    ED6          3FFF                  ADDLW 0xFF                 
    3800    ED7          3FFF                  ADDLW 0xFF                 
    3801    ED8          3FFF                  ADDLW 0xFF                 
    3802    ED9          3FFF                  ADDLW 0xFF                 
    3803    EDA          3FFF                  ADDLW 0xFF                 
    3804    EDB          3FFF                  ADDLW 0xFF                 
    3805    EDC          3FFF                  ADDLW 0xFF                 
    3806    EDD          3FFF                  ADDLW 0xFF                 
    3807    EDE          3FFF                  ADDLW 0xFF                 
    3808    EDF          3FFF                  ADDLW 0xFF                 
    3809    EE0          3FFF                  ADDLW 0xFF                 
    3810    EE1          3FFF                  ADDLW 0xFF                 
    3811    EE2          3FFF                  ADDLW 0xFF                 
    3812    EE3          3FFF                  ADDLW 0xFF                 
    3813    EE4          3FFF                  ADDLW 0xFF                 
    3814    EE5          3FFF                  ADDLW 0xFF                 
    3815    EE6          3FFF                  ADDLW 0xFF                 
    3816    EE7          3FFF                  ADDLW 0xFF                 
    3817    EE8          3FFF                  ADDLW 0xFF                 
    3818    EE9          3FFF                  ADDLW 0xFF                 
    3819    EEA          3FFF                  ADDLW 0xFF                 
    3820    EEB          3FFF                  ADDLW 0xFF                 
    3821    EEC          3FFF                  ADDLW 0xFF                 
    3822    EED          3FFF                  ADDLW 0xFF                 
    3823    EEE          3FFF                  ADDLW 0xFF                 
    3824    EEF          3FFF                  ADDLW 0xFF                 
    3825    EF0          3FFF                  ADDLW 0xFF                 
    3826    EF1          3FFF                  ADDLW 0xFF                 
    3827    EF2          3FFF                  ADDLW 0xFF                 
    3828    EF3          3FFF                  ADDLW 0xFF                 
    3829    EF4          3FFF                  ADDLW 0xFF                 
    3830    EF5          3FFF                  ADDLW 0xFF                 
    3831    EF6          3FFF                  ADDLW 0xFF                 
    3832    EF7          3FFF                  ADDLW 0xFF                 
    3833    EF8          3FFF                  ADDLW 0xFF                 
    3834    EF9          3FFF                  ADDLW 0xFF                 
    3835    EFA          3FFF                  ADDLW 0xFF                 
    3836    EFB          3FFF                  ADDLW 0xFF                 
    3837    EFC          3FFF                  ADDLW 0xFF                 
    3838    EFD          3FFF                  ADDLW 0xFF                 
    3839    EFE          3FFF                  ADDLW 0xFF                 
    3840    EFF          3FFF                  ADDLW 0xFF                 
    3841    F00          3FFF                  ADDLW 0xFF                 
    3842    F01          3FFF                  ADDLW 0xFF                 
    3843    F02          3FFF                  ADDLW 0xFF                 
    3844    F03          3FFF                  ADDLW 0xFF                 
    3845    F04          3FFF                  ADDLW 0xFF                 
    3846    F05          3FFF                  ADDLW 0xFF                 
    3847    F06          3FFF                  ADDLW 0xFF                 
    3848    F07          3FFF                  ADDLW 0xFF                 
    3849    F08          3FFF                  ADDLW 0xFF                 
    3850    F09          3FFF                  ADDLW 0xFF                 
    3851    F0A          3FFF                  ADDLW 0xFF                 
    3852    F0B          3FFF                  ADDLW 0xFF                 
    3853    F0C          3FFF                  ADDLW 0xFF                 
    3854    F0D          3FFF                  ADDLW 0xFF                 
    3855    F0E          3FFF                  ADDLW 0xFF                 
    3856    F0F          3FFF                  ADDLW 0xFF                 
    3857    F10          3FFF                  ADDLW 0xFF                 
    3858    F11          3FFF                  ADDLW 0xFF                 
    3859    F12          3FFF                  ADDLW 0xFF                 
    3860    F13          3FFF                  ADDLW 0xFF                 
    3861    F14          3FFF                  ADDLW 0xFF                 
    3862    F15          3FFF                  ADDLW 0xFF                 
    3863    F16          3FFF                  ADDLW 0xFF                 
    3864    F17          3FFF                  ADDLW 0xFF                 
    3865    F18          3FFF                  ADDLW 0xFF                 
    3866    F19          3FFF                  ADDLW 0xFF                 
    3867    F1A          3FFF                  ADDLW 0xFF                 
    3868    F1B          3FFF                  ADDLW 0xFF                 
    3869    F1C          3FFF                  ADDLW 0xFF                 
    3870    F1D          3FFF                  ADDLW 0xFF                 
    3871    F1E          3FFF                  ADDLW 0xFF                 
    3872    F1F          3FFF                  ADDLW 0xFF                 
    3873    F20          3FFF                  ADDLW 0xFF                 
    3874    F21          3FFF                  ADDLW 0xFF                 
    3875    F22          3FFF                  ADDLW 0xFF                 
    3876    F23          3FFF                  ADDLW 0xFF                 
    3877    F24          3FFF                  ADDLW 0xFF                 
    3878    F25          3FFF                  ADDLW 0xFF                 
    3879    F26          3FFF                  ADDLW 0xFF                 
    3880    F27          3FFF                  ADDLW 0xFF                 
    3881    F28          3FFF                  ADDLW 0xFF                 
    3882    F29          3FFF                  ADDLW 0xFF                 
    3883    F2A          3FFF                  ADDLW 0xFF                 
    3884    F2B          3FFF                  ADDLW 0xFF                 
    3885    F2C          3FFF                  ADDLW 0xFF                 
    3886    F2D          3FFF                  ADDLW 0xFF                 
    3887    F2E          3FFF                  ADDLW 0xFF                 
    3888    F2F          3FFF                  ADDLW 0xFF                 
    3889    F30          3FFF                  ADDLW 0xFF                 
    3890    F31          3FFF                  ADDLW 0xFF                 
    3891    F32          3FFF                  ADDLW 0xFF                 
    3892    F33          3FFF                  ADDLW 0xFF                 
    3893    F34          3FFF                  ADDLW 0xFF                 
    3894    F35          3FFF                  ADDLW 0xFF                 
    3895    F36          3FFF                  ADDLW 0xFF                 
    3896    F37          3FFF                  ADDLW 0xFF                 
    3897    F38          3FFF                  ADDLW 0xFF                 
    3898    F39          3FFF                  ADDLW 0xFF                 
    3899    F3A          3FFF                  ADDLW 0xFF                 
    3900    F3B          3FFF                  ADDLW 0xFF                 
    3901    F3C          3FFF                  ADDLW 0xFF                 
    3902    F3D          3FFF                  ADDLW 0xFF                 
    3903    F3E          3FFF                  ADDLW 0xFF                 
    3904    F3F          3FFF                  ADDLW 0xFF                 
    3905    F40          3FFF                  ADDLW 0xFF                 
    3906    F41          3FFF                  ADDLW 0xFF                 
    3907    F42          3FFF                  ADDLW 0xFF                 
    3908    F43          3FFF                  ADDLW 0xFF                 
    3909    F44          3FFF                  ADDLW 0xFF                 
    3910    F45          3FFF                  ADDLW 0xFF                 
    3911    F46          3FFF                  ADDLW 0xFF                 
    3912    F47          3FFF                  ADDLW 0xFF                 
    3913    F48          3FFF                  ADDLW 0xFF                 
    3914    F49          3FFF                  ADDLW 0xFF                 
    3915    F4A          3FFF                  ADDLW 0xFF                 
    3916    F4B          3FFF                  ADDLW 0xFF                 
    3917    F4C          3FFF                  ADDLW 0xFF                 
    3918    F4D          3FFF                  ADDLW 0xFF                 
    3919    F4E          3FFF                  ADDLW 0xFF                 
    3920    F4F          3FFF                  ADDLW 0xFF                 
    3921    F50          3FFF                  ADDLW 0xFF                 
    3922    F51          3FFF                  ADDLW 0xFF                 
    3923    F52          3FFF                  ADDLW 0xFF                 
    3924    F53          3FFF                  ADDLW 0xFF                 
    3925    F54          3FFF                  ADDLW 0xFF                 
    3926    F55          3FFF                  ADDLW 0xFF                 
    3927    F56          3FFF                  ADDLW 0xFF                 
    3928    F57          3FFF                  ADDLW 0xFF                 
    3929    F58          3FFF                  ADDLW 0xFF                 
    3930    F59          3FFF                  ADDLW 0xFF                 
    3931    F5A          3FFF                  ADDLW 0xFF                 
    3932    F5B          3FFF                  ADDLW 0xFF                 
    3933    F5C          3FFF                  ADDLW 0xFF                 
    3934    F5D          3FFF                  ADDLW 0xFF                 
    3935    F5E          3FFF                  ADDLW 0xFF                 
    3936    F5F          3FFF                  ADDLW 0xFF                 
    3937    F60          3FFF                  ADDLW 0xFF                 
    3938    F61          3FFF                  ADDLW 0xFF                 
    3939    F62          3FFF                  ADDLW 0xFF                 
    3940    F63          3FFF                  ADDLW 0xFF                 
    3941    F64          3FFF                  ADDLW 0xFF                 
    3942    F65          3FFF                  ADDLW 0xFF                 
    3943    F66          3FFF                  ADDLW 0xFF                 
    3944    F67          3FFF                  ADDLW 0xFF                 
    3945    F68          3FFF                  ADDLW 0xFF                 
    3946    F69          3FFF                  ADDLW 0xFF                 
    3947    F6A          3FFF                  ADDLW 0xFF                 
    3948    F6B          3FFF                  ADDLW 0xFF                 
    3949    F6C          3FFF                  ADDLW 0xFF                 
    3950    F6D          3FFF                  ADDLW 0xFF                 
    3951    F6E          3FFF                  ADDLW 0xFF                 
    3952    F6F          3FFF                  ADDLW 0xFF                 
    3953    F70          3FFF                  ADDLW 0xFF                 
    3954    F71          3FFF                  ADDLW 0xFF                 
    3955    F72          3FFF                  ADDLW 0xFF                 
    3956    F73          3FFF                  ADDLW 0xFF                 
    3957    F74          3FFF                  ADDLW 0xFF                 
    3958    F75          3FFF                  ADDLW 0xFF                 
    3959    F76          3FFF                  ADDLW 0xFF                 
    3960    F77          3FFF                  ADDLW 0xFF                 
    3961    F78          3FFF                  ADDLW 0xFF                 
    3962    F79          3FFF                  ADDLW 0xFF                 
    3963    F7A          3FFF                  ADDLW 0xFF                 
    3964    F7B          3FFF                  ADDLW 0xFF                 
    3965    F7C          3FFF                  ADDLW 0xFF                 
    3966    F7D          3FFF                  ADDLW 0xFF                 
    3967    F7E          3FFF                  ADDLW 0xFF                 
    3968    F7F          3FFF                  ADDLW 0xFF                 
    3969    F80          3FFF                  ADDLW 0xFF                 
    3970    F81          3FFF                  ADDLW 0xFF                 
    3971    F82          3FFF                  ADDLW 0xFF                 
    3972    F83          3FFF                  ADDLW 0xFF                 
    3973    F84          3FFF                  ADDLW 0xFF                 
    3974    F85          3FFF                  ADDLW 0xFF                 
    3975    F86          3FFF                  ADDLW 0xFF                 
    3976    F87          3FFF                  ADDLW 0xFF                 
    3977    F88          3FFF                  ADDLW 0xFF                 
    3978    F89          3FFF                  ADDLW 0xFF                 
    3979    F8A          3FFF                  ADDLW 0xFF                 
    3980    F8B          3FFF                  ADDLW 0xFF                 
    3981    F8C          3FFF                  ADDLW 0xFF                 
    3982    F8D          3FFF                  ADDLW 0xFF                 
    3983    F8E          3FFF                  ADDLW 0xFF                 
    3984    F8F          3FFF                  ADDLW 0xFF                 
    3985    F90          3FFF                  ADDLW 0xFF                 
    3986    F91          3FFF                  ADDLW 0xFF                 
    3987    F92          3FFF                  ADDLW 0xFF                 
    3988    F93          3FFF                  ADDLW 0xFF                 
    3989    F94          3FFF                  ADDLW 0xFF                 
    3990    F95          3FFF                  ADDLW 0xFF                 
    3991    F96          3FFF                  ADDLW 0xFF                 
    3992    F97          3FFF                  ADDLW 0xFF                 
    3993    F98          3FFF                  ADDLW 0xFF                 
    3994    F99          3FFF                  ADDLW 0xFF                 
    3995    F9A          3FFF                  ADDLW 0xFF                 
    3996    F9B          3FFF                  ADDLW 0xFF                 
    3997    F9C          3FFF                  ADDLW 0xFF                 
    3998    F9D          3FFF                  ADDLW 0xFF                 
    3999    F9E          3FFF                  ADDLW 0xFF                 
    4000    F9F          3FFF                  ADDLW 0xFF                 
    4001    FA0          3FFF                  ADDLW 0xFF                 
    4002    FA1          3FFF                  ADDLW 0xFF                 
    4003    FA2          3FFF                  ADDLW 0xFF                 
    4004    FA3          3FFF                  ADDLW 0xFF                 
    4005    FA4          3FFF                  ADDLW 0xFF                 
    4006    FA5          3FFF                  ADDLW 0xFF                 
    4007    FA6          3FFF                  ADDLW 0xFF                 
    4008    FA7          3FFF                  ADDLW 0xFF                 
    4009    FA8          3FFF                  ADDLW 0xFF                 
    4010    FA9          3FFF                  ADDLW 0xFF                 
    4011    FAA          3FFF                  ADDLW 0xFF                 
    4012    FAB          3FFF                  ADDLW 0xFF                 
    4013    FAC          3FFF                  ADDLW 0xFF                 
    4014    FAD          3FFF                  ADDLW 0xFF                 
    4015    FAE          3FFF                  ADDLW 0xFF                 
    4016    FAF          3FFF                  ADDLW 0xFF                 
    4017    FB0          3FFF                  ADDLW 0xFF                 
    4018    FB1          3FFF                  ADDLW 0xFF                 
    4019    FB2          3FFF                  ADDLW 0xFF                 
    4020    FB3          3FFF                  ADDLW 0xFF                 
    4021    FB4          3FFF                  ADDLW 0xFF                 
    4022    FB5          3FFF                  ADDLW 0xFF                 
    4023    FB6          3FFF                  ADDLW 0xFF                 
    4024    FB7          3FFF                  ADDLW 0xFF                 
    4025    FB8          3FFF                  ADDLW 0xFF                 
    4026    FB9          3FFF                  ADDLW 0xFF                 
    4027    FBA          3FFF                  ADDLW 0xFF                 
    4028    FBB          3FFF                  ADDLW 0xFF                 
    4029    FBC          3FFF                  ADDLW 0xFF                 
    4030    FBD          3FFF                  ADDLW 0xFF                 
    4031    FBE          3FFF                  ADDLW 0xFF                 
    4032    FBF          3FFF                  ADDLW 0xFF                 
    4033    FC0          3FFF                  ADDLW 0xFF                 
    4034    FC1          3FFF                  ADDLW 0xFF                 
    4035    FC2          3FFF                  ADDLW 0xFF                 
    4036    FC3          3FFF                  ADDLW 0xFF                 
    4037    FC4          3FFF                  ADDLW 0xFF                 
    4038    FC5          3FFF                  ADDLW 0xFF                 
    4039    FC6          3FFF                  ADDLW 0xFF                 
    4040    FC7          3FFF                  ADDLW 0xFF                 
    4041    FC8          3FFF                  ADDLW 0xFF                 
    4042    FC9          3FFF                  ADDLW 0xFF                 
    4043    FCA          3FFF                  ADDLW 0xFF                 
    4044    FCB          3FFF                  ADDLW 0xFF                 
    4045    FCC          3FFF                  ADDLW 0xFF                 
    4046    FCD          3FFF                  ADDLW 0xFF                 
    4047    FCE          3FFF                  ADDLW 0xFF                 
    4048    FCF          3FFF                  ADDLW 0xFF                 
    4049    FD0          3FFF                  ADDLW 0xFF                 
    4050    FD1          3FFF                  ADDLW 0xFF                 
    4051    FD2          3FFF                  ADDLW 0xFF                 
    4052    FD3          3FFF                  ADDLW 0xFF                 
    4053    FD4          3FFF                  ADDLW 0xFF                 
    4054    FD5          3FFF                  ADDLW 0xFF                 
    4055    FD6          3FFF                  ADDLW 0xFF                 
    4056    FD7          3FFF                  ADDLW 0xFF                 
    4057    FD8          3FFF                  ADDLW 0xFF                 
    4058    FD9          3FFF                  ADDLW 0xFF                 
    4059    FDA          3FFF                  ADDLW 0xFF                 
    4060    FDB          3FFF                  ADDLW 0xFF                 
    4061    FDC          3FFF                  ADDLW 0xFF                 
    4062    FDD          3FFF                  ADDLW 0xFF                 
    4063    FDE          3FFF                  ADDLW 0xFF                 
    4064    FDF          3FFF                  ADDLW 0xFF                 
    4065    FE0          3FFF                  ADDLW 0xFF                 
    4066    FE1          3FFF                  ADDLW 0xFF                 
    4067    FE2          3FFF                  ADDLW 0xFF                 
    4068    FE3          3FFF                  ADDLW 0xFF                 
    4069    FE4          3FFF                  ADDLW 0xFF                 
    4070    FE5          3FFF                  ADDLW 0xFF                 
    4071    FE6          3FFF                  ADDLW 0xFF                 
    4072    FE7          3FFF                  ADDLW 0xFF                 
    4073    FE8          3FFF                  ADDLW 0xFF                 
    4074    FE9          3FFF                  ADDLW 0xFF                 
    4075    FEA          3FFF                  ADDLW 0xFF                 
    4076    FEB          3FFF                  ADDLW 0xFF                 
    4077    FEC          3FFF                  ADDLW 0xFF                 
    4078    FED          3FFF                  ADDLW 0xFF                 
    4079    FEE          3FFF                  ADDLW 0xFF                 
    4080    FEF          3FFF                  ADDLW 0xFF                 
    4081    FF0          3FFF                  ADDLW 0xFF                 
    4082    FF1          3FFF                  ADDLW 0xFF                 
    4083    FF2          3FFF                  ADDLW 0xFF                 
    4084    FF3          3FFF                  ADDLW 0xFF                 
    4085    FF4          3FFF                  ADDLW 0xFF                 
    4086    FF5          3FFF                  ADDLW 0xFF                 
    4087    FF6          3FFF                  ADDLW 0xFF                 
    4088    FF7          3FFF                  ADDLW 0xFF                 
    4089    FF8          3FFF                  ADDLW 0xFF                 
    4090    FF9          3FFF                  ADDLW 0xFF                 
    4091    FFA          3FFF                  ADDLW 0xFF                 
    4092    FFB          3FFF                  ADDLW 0xFF                 
    4093    FFC          3FFF                  ADDLW 0xFF                 
    4094    FFD          3FFF                  ADDLW 0xFF                 
    4095    FFE          3FFF                  ADDLW 0xFF                 
    4096    FFF          3FFF                  ADDLW 0xFF                 
