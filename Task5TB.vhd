-------------------------------------------------------------------------------
--
-- Title       : Task5TB
-- Design      : NHLab11Task5
-- Author      : Naafiul Hossain
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : c:/My_Designs/NHLab11Task5/NHLab11Task5/src/Task5TB.vhd
-- Generated   : Wed May  1 13:41:58 2024
-- From        : Interface description file
-- By          : ItfToHdl ver. 1.0
--
-------------------------------------------------------------------------------
--
-- Description :  This testbench verifies the functionality of the hex_dig_mux multiplexer by applying stimuli to its inputs and checking the outputs against expected values.


--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--    and may be overwritten
--{entity {Task5TB} architecture {Task5TB}}


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_hex_dig_mux is
end entity testbench_hex_dig_mux;

architecture tb_arch of testbench_hex_dig_mux is

    -- Component declaration for the multiplexer
    component hex_dig_mux is
        port(
            hex_dig_0   : in  std_logic_vector(3 downto 0);
            hex_dig_1   : in  std_logic_vector(3 downto 0);
            hex_dig_2   : in  std_logic_vector(3 downto 0);
            hex_dig_3   : in  std_logic_vector(3 downto 0);
            sel         : in  std_logic_vector(1 downto 0);
            hex_dig_out : out std_logic_vector(3 downto 0)
        );
    end component hex_dig_mux;

    -- Signals for testbench stimulus
    signal stim_hex_dig_0 : std_logic_vector(3 downto 0) := "0000";
    signal stim_hex_dig_1 : std_logic_vector(3 downto 0) := "1111";
    signal stim_hex_dig_2 : std_logic_vector(3 downto 0) := "0101";
    signal stim_hex_dig_3 : std_logic_vector(3 downto 0) := "1010";
    signal stim_sel       : std_logic_vector(1 downto 0) := "00";
    signal stim_clk       : std_logic := '0';

    -- Signals for testbench assertions
    signal exp_output     : std_logic_vector(3 downto 0);

begin

    -- Instantiate the multiplexer
    UUT: hex_dig_mux
    port map(
        hex_dig_0   => stim_hex_dig_0,
        hex_dig_1   => stim_hex_dig_1,
        hex_dig_2   => stim_hex_dig_2,
        hex_dig_3   => stim_hex_dig_3,
        sel         => stim_sel,
        hex_dig_out => exp_output
    );

    -- Stimulus process: apply inputs
    stim_proc: process
    begin
        stim_sel <= "00";
        wait for 10 ns;
        
        stim_sel <= "01";
        wait for 10 ns;

        stim_sel <= "10";
        wait for 10 ns;

        stim_sel <= "11";
        wait for 10 ns;

        wait;
    end process stim_proc;

    -- Checking process: verify outputs
    check_proc: process
    begin
        wait for 40 ns; -- Wait for outputs to stabilize

        assert exp_output = "0000" report "Incorrect output for select input 00" severity error;
        wait for 10 ns;																						 -- the self check statments
        
        assert exp_output = "1111" report "Incorrect output for select input 01" severity error;
        wait for 10 ns;
        
        assert exp_output = "0101" report "Incorrect output for select input 10" severity error;
        wait for 10 ns;
        
        assert exp_output = "1010" report "Incorrect output for select input 11" severity error;
        wait;
    end process check_proc;

end architecture tb_arch;

