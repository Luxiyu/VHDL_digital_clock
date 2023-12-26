-- 二选一模块

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux21 IS
    PORT (A, B, S : IN STD_LOGIC;
		  Y : OUT STD_LOGIC
	);
END mux21;

ARCHITECTURE behavioral OF mux21 IS
BEGIN
	Y <= A WHEN S = '0' ELSE B;
END behavioral;