-- select module

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY clock_set IS
    PORT (CLK_HAND: IN STD_LOGIC;
		  SET_HOUR : OUT STD_LOGIC;
		  SET_MIN : OUT STD_LOGIC
		 );
END clock_set;

ARCHITECTURE behavioral OF clock_set IS
	SIGNAL countsec : INTEGER RANGE 0 TO 2 := 0;
	SIGNAL sel_h : STD_LOGIC;
	SIGNAL sel_m : STD_LOGIC;
	
	BEGIN
		set_clock:PROCESS(CLK_HAND)
		BEGIN
			IF CLK_HAND'EVENT AND CLK_HAND = '1' THEN
				IF countsec < 2 THEN
					countsec <= countsec + 1;
				ELSE
					countsec <= 0;
				END IF;
			END IF;
		END PROCESS;

		sel_m <= '1' WHEN countsec = 1 ELSE '0';
		sel_h <= '1' WHEN countsec = 2 ELSE '0';

		SET_MIN <= sel_m;
		SET_HOUR <= sel_h;

END behavioral;