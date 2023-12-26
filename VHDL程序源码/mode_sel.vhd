-- 启动/停止模块

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mode_sel IS
    PORT (KEY: IN STD_LOGIC;
		  Enable : OUT STD_LOGIC
	);
END mode_sel;

ARCHITECTURE behavioral OF mode_sel IS
	SIGNAL en : STD_LOGIC;
	BEGIN
		model_sel:PROCESS(KEY)
		BEGIN
			IF KEY'EVENT AND KEY = '1' THEN
				en <= NOT en;
			END IF;
		END PROCESS;
		Enable <= en;
END behavioral;