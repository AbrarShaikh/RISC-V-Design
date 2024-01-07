int read_keypad(void);
void display_output(int num);

int main()
{
	int keypad;

	//initialize with hypen (-)
	display_output(1);
	
	while(1)
	{
    	keypad = read_keypad();

		if(keypad == 0) display_output(1);
		else display_output(keypad);

		// Delay to avoid key Debounce
    	for (int i = 0; i < 1000000; i++)
			asm("nop");
	}	
	return(0);
}

int read_keypad(void)
{
	int keypad;
	//unsigned char row[5]={14,13,11,7,0};
	int i=0;
	int mask=0xFFFFFFF0;
	
	
	//row 0
	//row0=0xE=b1110=14;
	if(i == 0)
	{
		/*PUT Row0Code*/
		asm volatile(
			"and x30, x30, %0\n\t"
	    	"ori x30, x30, 14\n\t"
	    	:
	    	:"r"(mask)
	    	:"x30"
	    	);
	    /*Read Cols*/	
	    asm volatile(
	    	"andi %0, x30, 240\n\t"
	    	:"=r"(keypad)
	    	:
	    	:
	    	);
			
	    if(keypad != 240) 
	    {
	    	i=14;
	    }
	}
	
	//row1
	//row=13;
	if(i == 0)
	{
		asm volatile(
			"and x30, x30, %0\n\t"
	    	"ori x30, x30, 13\n\t"
	    	:
	    	:"r"(mask)
	    	:"x30"
	    	);
	    	
	    asm volatile(
	    	"andi %0, x30, 240\n\t"
	    	:"=r"(keypad)
	    	:
	    	:
	    	);
			
	    if(keypad != 240) 
	    {
	    	i=13;
	    }
	}
	//row2
	//row=11;
	if(i == 0)
	{
		asm volatile(
			"and x30, x30, %0\n\t"
	    	"ori x30, x30, 11\n\t"
	    	:
	    	:"r"(mask)
	    	:"x30"
	    	);
	    	
	    asm volatile(
	    	"andi %0, x30, 240\n\t"
	    	:"=r"(keypad)
	    	:
	    	:
	    	);
			
	    if(keypad != 240) 
	    {
	    	i=11;
	    }
	}
	
	//row3
	//row=7;
	if(i == 0)
	{
		asm volatile(
			"and x30, x30, %0\n\t"
	    	"ori x30, x30,  7\n\t"
	    	:
	    	:"r"(mask)
	    	:"x30"
	    	);
	    	
	    asm volatile(
	    	"andi %0, x30, 240\n\t"
	    	:"=r"(keypad)
	    	:
	    	:
	    	);
			
	    if(keypad != 240) 
	    {
	    	i=7;
	    }
	}

	if(i == 0)//no button pressed
	{
		return 0;
	}
	else
	{
		if(i == 14)//row=0, b1110
		{
			if(keypad == 224) keypad=48;      //1
			else if(keypad == 208) keypad=109;//2
			else if(keypad == 176) keypad=121;//3
			else if(keypad == 112) keypad=119;//A
		}
		else if(i == 13)//row=1
		{
			if(keypad == 224) keypad=51;     //4
			else if(keypad == 208) keypad=91;//5
			else if(keypad == 176) keypad=94;//6
			else if(keypad == 112) keypad=31;//B
		}
		else if(i == 11)//row=2
		{
			if(keypad == 224) keypad=112;     //7
			else if(keypad == 208) keypad=127;//8
			else if(keypad == 176) keypad=115;//9
			else if(keypad == 112) keypad=78; //C
		}
		else if(i == 7)//row=3
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
