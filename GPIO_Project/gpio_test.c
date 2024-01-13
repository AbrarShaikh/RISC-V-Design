#include<stdio.h>

int read_keypad(void);
void display_output(int num);
void write_key(char button);
void read_led(void);
 
int main()
{
	int keypad;
	int delay;
	char key;

	//initialize with hypen (-)
	printf("initailising with hyper(-)\n");
	display_output(1);
	read_led();
	
	while(1)
	{
		printf("press button: (0-9,A-E)\n");
		scanf("%c",&key);

		if((key >= '0') && (key <= '9') || (key >= 'a') && (key <= 'e'))
		{
			printf("%c is pressed\t",key);
			write_key(key);
		}		
		else 
		{
			printf("noting is pressed\t");
			write_key('-');
		}
		
    	keypad = read_keypad();

		if(keypad == 0) display_output(1);
		else display_output(keypad);

		read_led();
	}	
	return(0);
}

int read_keypad(void)
{
	int keypad;
	int rowcode[5]={14,13,11,7,0};
	int row;
	int i=0;
	int mask=0xFFFFFFF0;
	
	while(rowcode[i] > 0)
	{
		/*row = rowcode[i];
		asm volatile(
			"and x30,x30,%1\n\t"
	    	"or x30, x30, %0\n\t"
	    	:
	    	:"r"(row),"r"(mask)
	    	:"x30"
	    	);*/

	    printf("scaning row %d: ",i);
        printf("row[%d]= %d\n", i, rowcode[i]);

		asm volatile(
	    	"andi %0, x30, 0x000f\n\t"
            "andi %1, x30, 0x00f0\n\t"
	    	:"=r"(row),"=r"(keypad)
	    	:
	    	:
	    	);
        printf("rowcode=%X, colcode=%X\t",row, keypad);

        asm volatile(
	    	"andi %0, x30, 0x000f\n\t"
	    	:"=r"(row)
	    	:
	    	:
	    	);

	    asm volatile(
	    	"andi %0, x30, 0x00f0\n\t"
	    	:"=r"(keypad)
	    	:
	    	:
	    	);
        printf("rowcode=%X, colcode=%X\n",row, keypad);
        
		if (row != rowcode[i]) keypad= 240;
        else break;

	    if(keypad == 240)
	    	{
				printf("no button pressed in row %d\n",i);
			}
		i++;

        asm volatile(
	    	"andi %0, x30, 0x00ff\n\t"
	    	:"=r"(keypad)
	    	:
	    	:
	    	);
        printf("rowcolcode=%X\n", keypad);		
	}
	
	if(rowcode[i] == 0)//no button pressed
	{
		printf("no button pressed yet\n");
		return 0;
	}
	else
	{
		if(rowcode[i] == 14)//row=0, b1110
		{
			if(keypad == 224) keypad=48;      //1
			else if(keypad == 208) keypad=109;//2
			else if(keypad == 176) keypad=121;//3
			else if(keypad == 112) keypad=119;//A
		}
		else if(rowcode[i] == 13)//row=1
		{
			if(keypad == 224) keypad=51;     //4
			else if(keypad == 208) keypad=91;//5
			else if(keypad == 176) keypad=94;//6
			else if(keypad == 112) keypad=31;//B
		}
		else if(rowcode[i] == 11)//row=2
		{
			if(keypad == 224) keypad=112;     //7
			else if(keypad == 208) keypad=127;//8
			else if(keypad == 176) keypad=115;//9
			else if(keypad == 112) keypad=78; //C
		}
		else if(rowcode[i] == 7)//row=3
		{
			if(keypad == 224) keypad=61;      //D
			else if(keypad == 208) keypad=79; //E
			else if(keypad == 176) keypad=71; //F
			else if(keypad == 112) keypad=126;//0
		}
	}
    return keypad;
}

void display_output(int num)
{
	int mask=0xFFFF80FF;
	int temp=num << 8; //shift by 8 bits to left to update display bits in x30[14:8]
	asm volatile( 
	    "and x30, x30, %1\n\t"
	    "or  x30, x30, %0\n\t"
	    :
	    :"r"(temp),"r"(mask)
	    :"x30"
	    );
}

void read_led()
{
	int led;

	asm volatile(
		"srli x10, x30, 8\n\t"
	    "andi %0, x10, 0x7f\n\t" 
        :"=r"(led)
        :
        :"x10"
		);
	printf("7segledcode: %d\n",led); 
}

void write_key(char button)
{
	int mask;
	int temp;
	switch(button)
	{
		case '1':
		temp = 0xEE;
		break;

		case '2':
		temp = 0xDE;
		break;

		case '3':
		temp = 0xBE;
		break;

		case 'a':
		temp = 0x7E;
		break;
		
		case '4':
		temp = 0xED;
		break;

		case '5':
		temp = 0xDD;
		break;

		case '6':
		temp = 0xBD;
		break;

		case 'b':
		temp = 0x7D;
		break;

		case '7':
		temp = 0xEB;
		break;

		case '8':
		temp = 0xDB;
		break;

		case '9':
		temp = 0xBB;
		break;

		case 'C':
		temp = 0x7B;
		break;

		case '0':
		temp = 0xE7;
		break;

		case 'e':
		temp = 0xD7;
		break;

		case 'f':
		temp = 0xB7;
		break;

		case 'd':
		temp = 0x77;
		break;

		default:
		temp = 0xFF;
		break;
	}
    mask=0xFFFFFF00;
    printf("pressed key=%c\n",button);
    printf("rowcolcode=%X\n",temp);
	asm volatile( 
	    "and x30, x30, %0\n\t"
		"or  x30, x30, %1\n\t"
    	:
	    :"r"(mask),"r"(temp)
		:"x30"
    	);

    asm volatile( 
	    "andi %0, x30, 0x00FF\n\t"
    	:"=r"(temp)
	    :
		:
    	);
    printf("readbackrowcolcode=%X\n",temp);
}