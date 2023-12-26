-- counter 24 for hour

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY counter24_hour IS
    PORT (CLK : IN STD_LOGIC;
		  CLR : IN STD_LOGIC;
		  CNT_EN : IN STD_LOGIC;
		  BCD1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  BCD0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END counter24_hour;

ARCHITECTURE behavioral OF counter24_hour IS
	SIGNAL countsec1 : INTEGER RANGE 0 TO 2 := 0; -- ten-bit
	SIGNAL countsec0 : INTEGER RANGE 0 TO 9 := 0; -- single-bit
	BEGIN
		counter60:PROCESS(CLK, CLR, CNT_EN)
		BEGIN
			IF CLR = '1' THEN
				countsec1 <= 0;
				countsec0 <= 0;
			ELSIF CLK'EVENT AND CLK = '1' THEN
					IF CNT_EN = '1' THEN
						IF countsec1=2 AND countsec0=3 THEN
							countsec1 <= 0;
							countsec0 <= 0;
						ELSE
							IF countsec0 < 9 THEN 
								countsec0 <= countsec0 + 1;
							ELSE
								countsec0 <= 0;
								countsec1 <= countsec1 + 1;
							END IF;
						END IF;
					END IF;
			END IF;	
		END PROCESS;
		

		BCD1 <= "0000" WHEN countsec1 = 0 ELSE
			    "0001" WHEN countsec1 = 1 ELSE
				"0010" WHEN countsec1 = 2 ELSE
			   	"1111";
						
		BCD0 <= "0000" WHEN countsec0 = 0 ELSE
		   	 	"0001" WHEN countsec0 = 1 ELSE
		   	 	"0010" WHEN countsec0 = 2 ELSE
		   	 	"0011" WHEN countsec0 = 3 ELSE
		   	 	"0100" WHEN countsec0 = 4 ELSE
		   	 	"0101" WHEN countsec0 = 5 ELSE
		   	 	"0110" WHEN countsec0 = 6 ELSE
		   	 	"0111" WHEN countsec0 = 7 ELSE
		   	 	"1000" WHEN countsec0 = 8 ELSE
		   	 	"1001" WHEN countsec0 = 9 ELSE
		   	 	"1111";

END behavioral;