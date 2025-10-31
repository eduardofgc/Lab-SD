LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FLIP_FLOP IS
    PORT(
        PR, CLR, J, K, CLOCK: IN STD_LOGIC;
        Q: OUT STD_LOGIC
    );
END FLIP_FLOP;

ARCHITECTURE FLIP_FLOP_ARCH OF FLIP_FLOP IS
    SIGNAL Q_INST: STD_LOGIC := '0'; --SOFT INIT
BEGIN
    PROCESS(CLOCK)
    BEGIN
	
	IF PR = '1' THEN -- (PRESET 1)
	    Q_INST <= '1';
	ELSIF CLR = '1' THEN -- (CLEAR 0)
	    Q_INST <= '0';
        ELSIF RISING_EDGE(CLOCK) THEN
            IF J = '0' AND K = '0' THEN
                Q_INST <= Q_INST; -- (MANTEM ESTADO ANTIGO)
            ELSIF J = '0' AND K = '1' THEN
                Q_INST <= '0'; -- (RESET)
            ELSIF J = '1' AND K = '0' THEN
                Q_INST <= '1'; -- (SET)
            ELSIF J = '1' AND K = '1' THEN
                Q_INST <= NOT Q_INST; -- (INVERTE ESTADO ANTIGO)
            END IF;
        END IF;
    END PROCESS;

    Q <= Q_INST;
END FLIP_FLOP_ARCH;
