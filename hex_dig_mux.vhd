-------------------------------------------------------------------------------
--
-- Title       : hex_dig_mux
-- Design      : NHLab11Task5
-- Author      : Naafiul Hossain
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : c:/My_Designs/NHLab11Task5/NHLab11Task5/src/hex_dig_mux.vhd
-- Generated   : Wed May  1 13:22:53 2024
-- From        : Interface description file
-- By          : ItfToHdl ver. 1.0
--
-------------------------------------------------------------------------------
--
-- Description : 
--	The hex_dig_mux VHDL file defines a multiplexer entity that selects one of four input vectors based on select inputs and provides the selected vector as output.


-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--    and may be overwritten
--{entity {hex_dig_mux} architecture {hex_dig_mux}}



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex_dig_mux is
    port(
        hex_dig_0   : in  std_logic_vector(3 downto 0); -- Input vector for hex digit 0
        hex_dig_1   : in  std_logic_vector(3 downto 0); -- Input vector for hex digit 1
        hex_dig_2   : in  std_logic_vector(3 downto 0); -- Input vector for hex digit 2
        hex_dig_3   : in  std_logic_vector(3 downto 0); -- Input vector for hex digit 3
        sel         : in  std_logic_vector(1 downto 0); -- Select inputs for multiplexer
        hex_dig_out : out std_logic_vector(3 downto 0)  -- Output vector from multiplexer
    );
end entity hex_dig_mux;

architecture mux_arch of hex_dig_mux is
begin
    -- Process for selecting the appropriate input vector based on select inputs
    process(sel, hex_dig_0, hex_dig_1, hex_dig_2, hex_dig_3)
    begin
        -- Case statement to choose input vector based on select inputs
        case sel is
            when "00" =>
                hex_dig_out <= hex_dig_0; -- Select hex digit 0 input vector
            when "01" =>
                hex_dig_out <= hex_dig_1; -- Select hex digit 1 input vector
            when "10" =>
                hex_dig_out <= hex_dig_2; -- Select hex digit 2 input vector
            when others =>
                hex_dig_out <= hex_dig_3; -- Default: Select hex digit 3 input vector
        end case;
    end process;
end architecture mux_arch;

