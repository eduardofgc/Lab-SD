LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY REG_DESLOCAMENTO IS
    PORT(
        RST, LOAD, DIR, L, R, CLOCK : IN STD_LOGIC;
        D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END REG_DESLOCAMENTO;

ARCHITECTURE REG_DESLOCAMENTO_ARCH OF REG_DESLOCAMENTO IS

SIGNAL DIR_INST : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Q_INST   : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    DIR_INST <= DIR & L & R;

    PROCESS(CLOCK, RST)
    BEGIN
        
        IF rising_edge(CLOCK) THEN

		IF RST = '1' THEN
            Q_INST <= "0000";
        

            ELSIF LOAD = '1' THEN
                Q_INST <= D;
            ELSE
                CASE DIR_INST IS
                    WHEN "000" => Q_INST <= Q_INST(2) & Q_INST(1) & Q_INST(0) & '0';
                    WHEN "001" => Q_INST <= Q_INST(2) & Q_INST(1) & Q_INST(0) & '0';
                    WHEN "010" => Q_INST <= Q_INST(2) & Q_INST(1) & Q_INST(0) & '1';
                    WHEN "011" => Q_INST <= Q_INST(2) & Q_INST(1) & Q_INST(0) & '1';
                    WHEN "100" => Q_INST <= '0' & Q_INST(3) & Q_INST(2) & Q_INST(1);
                    WHEN "101" => Q_INST <= '0' & Q_INST(3) & Q_INST(2) & Q_INST(1);
                    WHEN "110" => Q_INST <= '1' & Q_INST(3) & Q_INST(2) & Q_INST(1);
                    WHEN "111" => Q_INST <= '1' & Q_INST(3) & Q_INST(2) & Q_INST(1);
                    WHEN OTHERS => Q_INST <= Q_INST;
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    Q <= Q_INST;
END REG_DESLOCAMENTO_ARCH;
