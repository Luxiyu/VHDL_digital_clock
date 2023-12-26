-- counter 10 for millisecond

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY counter10_millisecond IS
    PORT (CLK : IN STD_LOGIC;
		  CLR : IN STD_LOGIC;
		  CNT_EN : IN STD_LOGIC;
		  Co : OUT STD_LOGIC;
		  BCD0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END counter10_millisecond;

ARCHITECTURE behavioral OF counter10_millisecond IS
	SIGNAL countsec0 : INTEGER RANGE 0 TO 9 := 0; -- single-bit
	BEGIN
		counter10:PROCESS(CLK, CLR, CNT_EN)
		BEGIN
			IF CLR = '1' THEN
				countsec0 <= 0;
			ELSIF CLK'EVENT AND CLK = '1' THEN
				IF CNT_EN = '1' THEN
					IF countsec0 < 9 THEN 
						countsec0 <= countsec0 + 1;
						Co <= '0';
					ELSE
						countsec0 <= 0;
						Co <= '1';
					END IF;	
				END IF;
			END IF;
		END PROCESS;
		
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

